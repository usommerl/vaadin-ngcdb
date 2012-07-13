package de.htwkleipzig.ngcdb.ui;

import java.util.List;

import com.vaadin.data.Validator.InvalidValueException;

import com.vaadin.event.ShortcutAction.KeyCode;

import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;

import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.Form;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.TextArea;
import com.vaadin.ui.TextField;
import com.vaadin.ui.Window;

import static de.htwkleipzig.ngcdb.Constants.*;
import static com.vaadin.ui.AbstractSelect.Filtering.*;
import static com.vaadin.ui.Window.Notification.*;

public class SearchImageForm extends Form implements ClickShortcutRegistrar{

    static final long serialVersionUID = 21L;
    private final static String WIDTH_FORM_ELEMENTS = "100%"; 
    private TextField fieldObjectID;
    private TextArea fieldDescription;
    private ComboBox selectObjecttype;
    private ComboBox selectImageProvider;
    private HorizontalLayout layoutButtons;
    private Button btnSearch;
    private Button btnReset;
    private final SearchImageComponent rootComponent;

    public SearchImageForm(SearchImageComponent rootComponent) {
        this.rootComponent = rootComponent;
        layout();
        registerListeners();
    }

    private void registerListeners() {
        final ClickListener searchClickListener = new Button.ClickListener() {
            static final long serialVersionUID = 211L;
            private final String selectClause = "select distinct(IID) from view_searchImageComponent";
            public void buttonClick(ClickEvent event) {
			    buttonAction(false);
            }
            
            public void buttonAction(boolean fuzzySearch) {
                try {
                    validate();
                    StringBuilder whereClause = new StringBuilder();
                    if (!fieldObjectID.getValue().toString().isEmpty()){
                        whereClause.append("NGCID = "+fieldObjectID.getValue().toString());
                    }
                    if (selectObjecttype.getValue() != null) {
                        if (whereClause.length() > 0) whereClause.append(" and ");
                        whereClause.append("OID = "+selectObjecttype.getItem(selectObjecttype.getValue()).getItemProperty("ID").getValue());
                    }
                    if (selectImageProvider.getValue() != null) {
                        if (whereClause.length() > 0) whereClause.append(" and ");
                        whereClause.append("PID = '"+selectImageProvider.getItem(selectImageProvider.getValue()).getItemProperty("ABBR").getValue()+"'");
                    }
                    if (!fieldDescription.getValue().toString().isEmpty()){
                        if (whereClause.length() > 0) whereClause.append(" and ");
                        String escapedInput = "{"+fieldDescription.getValue().toString()+"}";
                        if (fuzzySearch) {
                            escapedInput = "fuzzy("+escapedInput+")";
                        }
                        whereClause.append("contains (description, '"+escapedInput+"') > 0");
                    }
                    if (whereClause.length() == 0) {
                        /* do nothing */
                    } else {
                        whereClause.insert(0, " where ");
                        List<Integer> imageIds = rootComponent.getDatabase().getImageIds(selectClause + whereClause.toString(), "IID");
                        if (imageIds.isEmpty()) {
                            if (!fuzzySearch && !fieldDescription.getValue().toString().isEmpty()) {
                                buttonAction(true);
                            } else {
                                rootComponent.getImagePager().disableResultsView();
                                Window.Notification notification = new Window.Notification("No match", TYPE_HUMANIZED_MESSAGE);
                                notification.setPosition(POSITION_CENTERED_BOTTOM);
                                getWindow().showNotification(notification);
                            }
                        } else {
                            rootComponent.getImagePager().setImageIds(imageIds);
                            rootComponent.getImagePager().enableFuzzyIndicator(fuzzySearch);
                        }
                    }
                } catch (InvalidValueException e) { /* do nothing */ }
            }
		};

        btnSearch.addListener(searchClickListener);

        btnReset.addListener(new Button.ClickListener(){
            static final long serialVersionUID = 212L;
            public void buttonClick(ClickEvent event) {
			    fieldObjectID.setValue("");
                selectObjecttype.setValue(null);
                selectImageProvider.setValue(null);
                fieldDescription.setValue("");
                rootComponent.getImagePager().disableResultsView();
                fieldObjectID.focus();
			}
        });
    }

    private void layout() {
        setStyleName(getClass().getSimpleName());
        setWidth("100%");
        setValidationVisible(true);
        fieldObjectID = new TextField(OBJECTID);
        fieldObjectID.addValidator(new IntegerRangeValidator(OBJECTID_MIN_VALUE,OBJECTID_MAX_VALUE,ERR_MESSAGE_OBJECTID));
        fieldObjectID.setWidth(WIDTH_FORM_ELEMENTS);
        selectObjecttype = new ComboBox(OBJECTTYPE, rootComponent.getDatabase().getObjectTypesContainer());
        selectObjecttype.setItemCaptionPropertyId("NAME");
        selectObjecttype.setWidth(WIDTH_FORM_ELEMENTS);
        selectObjecttype.setFilteringMode(FILTERINGMODE_CONTAINS);
        selectImageProvider = new ComboBox(IMAGEPROVIDER, rootComponent.getDatabase().getImageProvidersContainer());
        selectImageProvider.setItemCaptionPropertyId("FULLNAME");
        selectImageProvider.setWidth(WIDTH_FORM_ELEMENTS);
        selectImageProvider.setFilteringMode(FILTERINGMODE_CONTAINS);
        fieldDescription = new TextArea(TEXT_SEARCH);
        fieldDescription.addStyleName("CaptionDescription");
        fieldDescription.setWidth(WIDTH_FORM_ELEMENTS);
        layoutButtons = new HorizontalLayout();
        btnSearch = new Button(SEARCH);
        btnReset = new Button(RESET);
        layoutButtons.setSpacing(true);
        Label spacer = new Label();
        layoutButtons.addComponent(spacer);
        layoutButtons.addComponent(btnReset);
        layoutButtons.addComponent(btnSearch);
        layoutButtons.setComponentAlignment(btnSearch, Alignment.BOTTOM_RIGHT);
        layoutButtons.setComponentAlignment(btnReset, Alignment.BOTTOM_RIGHT);
        layoutButtons.setWidth(WIDTH_FORM_ELEMENTS);
        layoutButtons.setExpandRatio(spacer, 1.0f);
        addField(OBJECTID,fieldObjectID);
        addField(OBJECTTYPE,selectObjecttype);
        addField(IMAGEPROVIDER,selectImageProvider);
        addField(TEXT_SEARCH,fieldDescription);
        setFooter(layoutButtons);
    }

    public void registerClickShortcuts() {
        btnSearch.setClickShortcut(KeyCode.ENTER);
    	btnReset.setClickShortcut(KeyCode.ESCAPE);
    }

    public void deregisterClickShortcuts() {
        btnSearch.removeClickShortcut();
        btnReset.removeClickShortcut();
    }

}
