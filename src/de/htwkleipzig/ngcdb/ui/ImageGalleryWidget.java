package de.htwkleipzig.ngcdb.ui;

import java.util.List;
import java.util.TreeMap;

import com.vaadin.event.ShortcutAction.KeyCode;
import com.vaadin.event.ShortcutAction.ModifierKey;

import com.vaadin.terminal.Sizeable;
import com.vaadin.terminal.StreamResource;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.Embedded;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.Panel;
import com.vaadin.ui.VerticalLayout;

import com.vaadin.ui.themes.BaseTheme;

import de.htwkleipzig.ngcdb.Database;
import de.htwkleipzig.ngcdb.Image;
import static de.htwkleipzig.ngcdb.Constants.*;

@SuppressWarnings("serial")
public class ImageGalleryWidget extends VerticalLayout {

	private Embedded embedded = new Embedded();
	private HorizontalLayout buttonLayout;
	private Panel imagePanel;
	private Button nextBtn;
	private Button prevBtn;
    private Label labelNumberOfImages;
    private Label spacer;
    private int currentImageNumber;
    private final Database database;
    private final TreeMap<Integer, StreamResource> resourceCache = new TreeMap<Integer, StreamResource>(); 
	
	public ImageGalleryWidget(Database database, List<Integer> imageIds) {
		super();
        this.database = database;
		layoutComponents(imageIds);
		addListeners();
	}
	
	private void layoutComponents(List<Integer> imageIds){;
        currentImageNumber = 1;
        for (Integer id : imageIds) {
            resourceCache.put(id, null);
        }
        
        int imageID = resourceCache.firstKey();
        StreamResource imageRessource = database.getImageResource(imageID);
        embedded = new Embedded(null,imageRessource);
        embedded.setType(Embedded.TYPE_IMAGE);
        imagePanel = new Panel();
        imagePanel.addStyleName("image");
        imagePanel.setHeight(MAX_IMAGE_SIZE_LARGE+2*SPACER_SIZE_LARGE, Sizeable.UNITS_PIXELS);
        imagePanel.setWidth(MAX_IMAGE_SIZE_LARGE+2*SPACER_SIZE_LARGE, Sizeable.UNITS_PIXELS);
        VerticalLayout imageLayout = (VerticalLayout) imagePanel.getContent();
        imageLayout.setMargin(false);
        imageLayout.setSizeFull();
        imageLayout.addComponent(embedded);
        imageLayout.setComponentAlignment(embedded, Alignment.MIDDLE_CENTER);
        
        resourceCache.put(imageID, imageRessource);
        UiUtils.setSizeAccordingToOrientation(embedded, MAX_IMAGE_SIZE_LARGE);
		
        buttonLayout = new HorizontalLayout();
        nextBtn = new Button("next >");
        nextBtn.addStyleName(BaseTheme.BUTTON_LINK);
        nextBtn.addStyleName("imageNavigation");
        prevBtn = new Button("< previous");
        prevBtn.addStyleName(BaseTheme.BUTTON_LINK);
        prevBtn.addStyleName("imageNavigation");
        prevBtn.setEnabled(false);
        if (imageIds.size() == 1) {
            nextBtn.setEnabled(false);
        }
        labelNumberOfImages = new Label(currentImageNumber+" / "+resourceCache.size());
        buttonLayout.addComponent(prevBtn);
		buttonLayout.addComponent(labelNumberOfImages);
		buttonLayout.addComponent(nextBtn);
        buttonLayout.setComponentAlignment(labelNumberOfImages,Alignment.MIDDLE_CENTER);
        buttonLayout.setComponentAlignment(nextBtn,Alignment.BOTTOM_RIGHT);
        buttonLayout.setComponentAlignment(prevBtn,Alignment.BOTTOM_LEFT);
        buttonLayout.setWidth(MAX_IMAGE_SIZE_LARGE+2+SPACER_SIZE_LARGE, Sizeable.UNITS_PIXELS);
        labelNumberOfImages.setSizeUndefined();
        spacer = new Label("");
        spacer.setHeight(1, Sizeable.UNITS_EM);
        
        addComponent(imagePanel);
        addComponent(spacer);
        addComponent(buttonLayout);
        setComponentAlignment(buttonLayout, Alignment.BOTTOM_CENTER);
	}
	
	private void addListeners() {
		nextBtn.addListener(new ClickListener() {
			public void buttonClick(ClickEvent event) {
				Integer currentId = ((Image)((StreamResource) embedded.getSource()).getStreamSource()).getId();
				Integer newId;
				if (resourceCache.higherKey(currentId) != null) {
                    newId = resourceCache.higherKey(currentId); 
                    setNewEmbeddedResource(newId);
                    labelNumberOfImages.setValue(++currentImageNumber+" / "+resourceCache.size());
                    if (resourceCache.higherKey(newId) == null) {
                        nextBtn.setEnabled(false);
                    }
                    prevBtn.setEnabled(true);
				}
			}
		});
        nextBtn.setClickShortcut(KeyCode.ARROW_RIGHT, new int[] {ModifierKey.SHIFT, ModifierKey.ALT});
		
		prevBtn.addListener(new ClickListener() {	
			public void buttonClick(ClickEvent event) {
				Integer currentId = ((Image)((StreamResource) embedded.getSource()).getStreamSource()).getId();
				Integer newId;
				if (resourceCache.lowerKey(currentId) != null) {
                    newId = resourceCache.lowerKey(currentId); 
                    setNewEmbeddedResource(newId);
                    labelNumberOfImages.setValue(--currentImageNumber+" / "+resourceCache.size());
                    if (resourceCache.lowerKey(newId) == null) {
                        prevBtn.setEnabled(false);
                    }
                    nextBtn.setEnabled(true);
				}
			}
		});
        prevBtn.setClickShortcut(KeyCode.ARROW_LEFT, new int[] {ModifierKey.SHIFT, ModifierKey.ALT});
	}
	
    private void setNewEmbeddedResource(int imageId) {
        StreamResource imageRessource;
        if (resourceCache.get(imageId) == null) {
            imageRessource = database.getImageResource(imageId);
            resourceCache.put(imageId, imageRessource);
        } else {
            imageRessource = resourceCache.get(imageId);
        }
        embedded.setSource(imageRessource);
        UiUtils.setSizeAccordingToOrientation(embedded, MAX_IMAGE_SIZE_LARGE); 
    }
}
