package de.htwkleipzig.ngcdb.ui;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.vaadin.event.MouseEvents;

import com.vaadin.event.ShortcutAction.KeyCode;
import com.vaadin.event.ShortcutAction.ModifierKey;

import com.vaadin.terminal.Sizeable;
import com.vaadin.terminal.StreamResource;

import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;

import com.vaadin.ui.Embedded;
import com.vaadin.ui.GridLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.Panel;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Window.CloseEvent;

import com.vaadin.ui.Window.CloseListener;

import com.vaadin.ui.themes.BaseTheme;
import com.vaadin.ui.themes.Reindeer;

import de.htwkleipzig.ngcdb.Database;
import de.htwkleipzig.ngcdb.Image;

public class ImagePagerComponent extends Panel implements ClickShortcutRegistrar{

    private HorizontalLayout controlBarLayout;
    private HorizontalLayout infoLayout;
    private HorizontalLayout buttonLayout;
    private Button btnNextPage;
    private Button btnPrevPage;
    private Label labelMatches;
    private Label labelPages;
    private Label labelFuzzyIndicator;
    private Label spacer;
    private ThumbnailPage currentPage;
    private List<Integer> imageIds;
    private final HashMap<Integer, ThumbnailPage> pageCache;
    private HashMap<Integer, List<Integer>> idsPerPage;
    private int numberOfPages = 0;
    private final int thumbnailPageColumns = 4;
    private final int thumbnailPageRows = 2;
    private final ThumbnailPage emptyPage = new ThumbnailPage(0, thumbnailPageColumns, thumbnailPageRows);
    static final long serialVersionUID = 22L;
    private final String initialPagesValue = "0 / 0";
    private final String initialMatchesValue = "0 matches";
    private final SearchImageComponent rootComponent;

    public ImagePagerComponent(SearchImageComponent rootComponent) {
        this.rootComponent = rootComponent;
        this.pageCache = new HashMap<Integer, ThumbnailPage>();
        layout();
        registerListeners();
    }
    
    private void layout() {
        currentPage = emptyPage;
        btnNextPage = new Button(">");
        btnNextPage.addStyleName(BaseTheme.BUTTON_LINK);
        btnNextPage.addStyleName("imageNavigation");
        btnPrevPage = new Button("<");
        btnPrevPage.addStyleName(BaseTheme.BUTTON_LINK);
        btnPrevPage.addStyleName("imageNavigation");
        labelPages = new Label(initialPagesValue);
        labelPages.setSizeUndefined();
        labelMatches = new Label(initialMatchesValue);
        labelMatches.setSizeUndefined();
        labelFuzzyIndicator = new Label("(fuzzy search)");
        labelFuzzyIndicator.addStyleName("fuzzySearch");
        labelFuzzyIndicator.setVisible(false);
        spacer = new Label();
        spacer.setWidth(8, Sizeable.UNITS_PIXELS);

        buttonLayout = new HorizontalLayout();
        buttonLayout.addComponent(btnPrevPage);
        buttonLayout.addComponent(labelPages);
        buttonLayout.addComponent(btnNextPage);
        buttonLayout.setComponentAlignment(btnPrevPage, Alignment.MIDDLE_LEFT);
        buttonLayout.setComponentAlignment(labelPages, Alignment.MIDDLE_CENTER);
        buttonLayout.setComponentAlignment(btnNextPage, Alignment.MIDDLE_RIGHT);
        buttonLayout.setWidth(110, Sizeable.UNITS_PIXELS);
        buttonLayout.setHeight(15, Sizeable.UNITS_PIXELS);

        infoLayout = new HorizontalLayout();
        infoLayout.setSpacing(true);
        infoLayout.addComponent(labelMatches);
        infoLayout.addComponent(labelFuzzyIndicator);

        controlBarLayout = new HorizontalLayout();
        controlBarLayout.setSpacing(true);
        controlBarLayout.addComponent(infoLayout);
        controlBarLayout.addComponent(buttonLayout);
        controlBarLayout.addComponent(spacer);
        controlBarLayout.setWidth(100, Sizeable.UNITS_PERCENTAGE);
        controlBarLayout.setComponentAlignment(infoLayout, Alignment.MIDDLE_LEFT);
        controlBarLayout.setExpandRatio(infoLayout, 1.0f);
        controlBarLayout.setComponentAlignment(buttonLayout, Alignment.MIDDLE_RIGHT);
        controlBarLayout.setEnabled(false);
        controlBarLayout.setHeight(15, Sizeable.UNITS_PIXELS);
        

        addComponent(currentPage);
        addComponent(controlBarLayout);
        
        addStyleName(getClass().getSimpleName());
        addStyleName(Reindeer.PANEL_LIGHT);
        ((VerticalLayout) getContent()).setMargin(false);
        ((VerticalLayout) getContent()).setSpacing(true);
        disableResultsView();
    }

    private void registerListeners() {
        btnNextPage.addListener(new Button.ClickListener() {
            static final long serialVersionUID = 221L;
			public void buttonClick(ClickEvent event) {
                int newPageNumber = currentPage.getPageNumber() + 1;
                if (newPageNumber <= numberOfPages) {
                    displayPage(newPageNumber);
                    btnPrevPage.setEnabled(true);
                }
                if (newPageNumber == numberOfPages) {
                    btnNextPage.setEnabled(false);
                }
			}
        });
        btnPrevPage.addListener(new Button.ClickListener() {
            static final long serialVersionUID = 222L;
			public void buttonClick(ClickEvent event) {
                int newPageNumber = currentPage.getPageNumber() - 1;
                if (newPageNumber > 0) {
                    displayPage(newPageNumber);
                    btnNextPage.setEnabled(true);
                }
                if (newPageNumber == 1) {
                    btnPrevPage.setEnabled(false);
                }
			}
        
        });
    }

    public void setImageIds(List<Integer> imageIds) {
        this.imageIds = imageIds;
        this.idsPerPage = calculateIdsPerPage(imageIds);
        displayFirstResultPage();
    }
    private HashMap<Integer, List<Integer>> calculateIdsPerPage(List<Integer> imageIds) {
        HashMap<Integer, List<Integer>> result = new HashMap<Integer, List<Integer>>();
        int maxImagesPerPage = thumbnailPageColumns * thumbnailPageRows;
        this.numberOfPages = (int) Math.ceil((double) imageIds.size() / maxImagesPerPage);
        Iterator<Integer> it = imageIds.iterator();
        for (int p = 1; p <= this.numberOfPages; p++) {
            List<Integer> idsForPage = new ArrayList<Integer>();
            for (int i = 0; i < maxImagesPerPage; i++) {
                if (it.hasNext()) { idsForPage.add(it.next()); }
                result.put(p, idsForPage);
            }
        }
        return result;
    }

    public void disableResultsView() {
        enableFuzzyIndicator(false);
        labelMatches.setValue(initialMatchesValue);
        labelPages.setValue(initialPagesValue);
        labelMatches.setVisible(false);
        labelPages.setVisible(false);
        controlBarLayout.setEnabled(false);
        replaceComponent(currentPage, emptyPage);
        currentPage = emptyPage;
    }

    private void displayFirstResultPage(){
        pageCache.clear();
        displayPage(1);
        controlBarLayout.setEnabled(true);
        labelMatches.setVisible(true);
        labelPages.setVisible(true);
        btnPrevPage.setEnabled(false);
        if (numberOfPages == 1) {
            btnNextPage.setEnabled(false);
        } else {
            btnNextPage.setEnabled(true);
        }
        focus();
    }

    private void displayPage(int pageId) {
        ThumbnailPage newPage;
        if (pageCache.get(pageId) == null) {
            List<Integer> imageIdsForPage = this.idsPerPage.get(pageId);
            assert(imageIdsForPage != null);
            newPage = new ThumbnailPage(pageId, thumbnailPageColumns, thumbnailPageRows, imageIdsForPage);
        } else {
            newPage = pageCache.get(pageId);
        }
        replaceComponent(currentPage, newPage);
        currentPage = newPage;
        labelMatches.setValue(imageIds.size() > 1 ? imageIds.size()+" matches" : imageIds.size()+" match" );
        labelPages.setValue(pageId+" / "+numberOfPages);
    }

    public void registerClickShortcuts() {
        btnNextPage.setClickShortcut(KeyCode.ARROW_RIGHT, new int[] {ModifierKey.SHIFT, ModifierKey.ALT});
        btnPrevPage.setClickShortcut(KeyCode.ARROW_LEFT, new int[] {ModifierKey.SHIFT, ModifierKey.ALT});
    }

    public void deregisterClickShortcuts() {
        btnNextPage.removeClickShortcut();
        btnPrevPage.removeClickShortcut();
    }

    public void enableFuzzyIndicator(boolean bool) {
        labelFuzzyIndicator.setVisible(bool);
    }


    private class ThumbnailPage extends GridLayout {
        static final long serialVersionUID = 2201L;
        private final int pageNumber;
        private final List<Integer> imageIds;

        public ThumbnailPage(int pageNumber, int columns, int rows) {
            this(pageNumber, columns, rows, new ArrayList<Integer>());
        }   
        public ThumbnailPage(int pageNumber, int columns, int rows, List<Integer> imageIds) {
            super(columns, rows);
            this.pageNumber = pageNumber;
            this.imageIds = imageIds;
            assert(columns*rows <= imageIds.size());
            layout();
        }

        private void layout() {
            setSpacing(true);
            Iterator<Integer> it = imageIds.iterator();
            for (int r = 0; r < getRows(); r++) {
                for (int c = 0; c < getColumns(); c++) {
                    Thumbnail thumb;
                    if (it.hasNext()) {
                        thumb = new Thumbnail(it.next());
                    } else {
                        thumb = new Thumbnail();    
                    }
                    addComponent(thumb,c,r);
                }
            }
        }
        public int getPageNumber() {
            return this.pageNumber;
        } 
    }

    private class Thumbnail extends Panel {
        static final long serialVersionUID = 2202L;
        private final int maxImageSize = 108;
        private final int spacing = 25;
	    private String styleName = "thumbnail";
        private Embedded embedded;
        private Database database;
        private Integer imageId = -1;
        
        public Thumbnail() {
            this.setHeight(maxImageSize+spacing,Sizeable.UNITS_PIXELS);
            this.setWidth(maxImageSize+spacing,Sizeable.UNITS_PIXELS);
            this.addStyleName(styleName);
        }

        public Thumbnail(Integer imageId) {
            this();
            this.imageId = imageId;
            this.database = rootComponent.getDatabase();
            layout();
            embedded.addListener(new MouseEvents.ClickListener(){
                static final long serialVersionUID = 22021L;
                public void click(com.vaadin.event.MouseEvents.ClickEvent event) {
                    if (event.isDoubleClick()) {
                        StreamResource streamResource = (StreamResource) embedded.getSource();
                        DetailsWindowImage detailsWindow = new DetailsWindowImage(streamResource, database);
                        getApplication().getMainWindow().addWindow(detailsWindow);
                    }
				}
            });
        }
        
        private void layout() {
            embedded = new Embedded(null, database.getImageResource(imageId)); 
            embedded.setType(Embedded.TYPE_IMAGE);
            embedded.addStyleName(styleName);
            UiUtils.setSizeAccordingToOrientation(embedded,maxImageSize);
            VerticalLayout imageLayout = (VerticalLayout) getContent();
            imageLayout.setMargin(false);
            imageLayout.setSizeFull();
            addComponent(embedded);
            imageLayout.setComponentAlignment(embedded, Alignment.MIDDLE_CENTER);     
        }
    }

}
