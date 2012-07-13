package de.htwkleipzig.ngcdb.ui;

import java.util.List;

import com.vaadin.data.Item;

import com.vaadin.event.ShortcutAction.KeyCode;

import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.TextField;
import com.vaadin.ui.Window;
import static de.htwkleipzig.ngcdb.Constants.*;
import de.htwkleipzig.ngcdb.Database;

@SuppressWarnings("serial")
public class DetailsWindowObject extends Window {

    private String widthTextFields;
    private HorizontalLayout mainLayout;
    private FormLayout textualDetails;
    private TextField fieldObjectId;
    private TextField fieldObjectType;
    private TextField fieldRA;
    private TextField fieldDEC;
    private TextField fieldM;
    private TextField fieldConstellation;
    private TextField fieldConstellationMeaning;
    private TextField fieldYearOfDiscovery;
    private TextField fieldDiscoverer;
    private TextField fieldLifeSpan;
    private Label spacer1;
    private Label spacer2;
    private Label spacer3;
    private ImageGalleryWidget galleryWidget;
    private final Item item;
    private final Database database;
    private static final String STY_END_OF_BLOCK = "EndOfBlock";
    
    public DetailsWindowObject(Item item, Database database) {
        super("Object Details");
        this.item = item;
        this.database = database;
        layout();
        setModal(true);
        setResizable(false);
        getContent().setSizeUndefined();
        center();
        setCloseShortcut(KeyCode.ESCAPE);
        fieldObjectId.focus();
    }

    private void layout() {
        mainLayout = new HorizontalLayout();
        textualDetails = new FormLayout();
        textualDetails.addStyleName("ReadOnlyForm");
        spacer1 = new Label();
        spacer1.addStyleName(STY_END_OF_BLOCK);
        spacer2 = new Label();
        spacer2.addStyleName(STY_END_OF_BLOCK);
        spacer3 = new Label();
        spacer3.addStyleName(STY_END_OF_BLOCK);
        fieldObjectId = new TextField(OBJECTID+SEPARATOR);
        int objectId = Integer.parseInt(item.getItemProperty(PROP_OBJECTID).getValue().toString());
        fieldObjectId.setValue(objectId);
        fieldObjectId.setReadOnly(true);
        fieldObjectId.setNullRepresentation(NULL_REPRESENTATION);
        fieldObjectType = new TextField(OBJECTTYPE+SEPARATOR);
        fieldObjectType.setValue(item.getItemProperty(PROP_OBJECTTYPE).getValue());
        fieldObjectType.setReadOnly(true);
        fieldObjectType.setNullRepresentation(NULL_REPRESENTATION);
        fieldRA = new TextField(RA+SEPARATOR);
        fieldRA.setValue(item.getItemProperty(PROP_RA).getValue());
        fieldRA.setReadOnly(true);
        fieldRA.setNullRepresentation(NULL_REPRESENTATION);
        fieldDEC = new TextField(DEC+SEPARATOR);
        fieldDEC.setValue(item.getItemProperty(PROP_DEC).getValue());
        fieldDEC.setReadOnly(true);
        fieldDEC.setNullRepresentation(NULL_REPRESENTATION);
        fieldM = new TextField(M+SEPARATOR);
        fieldM.setValue(item.getItemProperty(PROP_M).getValue());
        fieldM.setReadOnly(true);
        fieldM.setNullRepresentation(NULL_REPRESENTATION);
        fieldConstellation = new TextField(CONSTELLATION+SEPARATOR);
        fieldConstellation.setValue(item.getItemProperty(PROP_CONSTELLATION).getValue());
        fieldConstellation.setReadOnly(true);
        fieldConstellation.setNullRepresentation(NULL_REPRESENTATION);
        fieldConstellationMeaning = new TextField();
        fieldConstellationMeaning.setValue("["+item.getItemProperty(PROP_CONSTELLATION_MEANING).getValue()+"]");
        fieldConstellationMeaning.setReadOnly(true);
        fieldConstellationMeaning.setNullRepresentation(NULL_REPRESENTATION);
        fieldYearOfDiscovery = new TextField(YEAR_OF_DISCOVERY+SEPARATOR);
        fieldYearOfDiscovery.setValue(UiUtils.formatNegativeYear(item.getItemProperty(PROP_YEAR_OF_DISCOVERY).getValue()));
        fieldYearOfDiscovery.setReadOnly(true);
        fieldYearOfDiscovery.setNullRepresentation(NULL_REPRESENTATION);
        String nameString = "";
        nameString = UiUtils.concatIfNotEmpty(nameString, " ", UiUtils.saveConvert(item.getItemProperty(PROP_FIRSTNAME).getValue()));
        nameString = UiUtils.concatIfNotEmpty(nameString, " ", UiUtils.saveConvert(item.getItemProperty(PROP_MIDDLENAMES).getValue()));
        nameString = UiUtils.concatIfNotEmpty(nameString, " ", UiUtils.saveConvert(item.getItemProperty(PROP_LASTNAME).getValue()));
        fieldDiscoverer = new TextField(DISCOVERER+SEPARATOR);
        fieldDiscoverer.setValue(nameString);
        fieldDiscoverer.setReadOnly(true);
        fieldDiscoverer.setNullRepresentation(NULL_REPRESENTATION);
        
        textualDetails.addComponent(fieldObjectId);
        textualDetails.addComponent(fieldObjectType);
        textualDetails.addComponent(spacer1);
        textualDetails.addComponent(fieldRA);
        textualDetails.addComponent(fieldDEC);
        textualDetails.addComponent(fieldM);
        textualDetails.addComponent(spacer2);
        textualDetails.addComponent(fieldConstellation);
        textualDetails.addComponent(fieldConstellationMeaning);
        textualDetails.addComponent(spacer3);
        textualDetails.addComponent(fieldYearOfDiscovery);
        textualDetails.addComponent(fieldDiscoverer);

        String yearOfBirth = UiUtils.formatNegativeYear(UiUtils.saveConvert(item.getItemProperty(PROP_YEAR_OF_BIRTH).getValue()));
        String yearOfDeath = UiUtils.formatNegativeYear(UiUtils.saveConvert(item.getItemProperty(PROP_YEAR_OF_DEATH).getValue()));
        fieldLifeSpan = new TextField();
        if (yearOfBirth.length() > 0 && yearOfDeath.length() > 0) {
            fieldLifeSpan.setValue("["+yearOfBirth+" - "+yearOfDeath+"]");
            fieldLifeSpan.setReadOnly(true); 
            textualDetails.addComponent(fieldLifeSpan);
        }

        widthTextFields = UiUtils.calculateSizeAccordingToTextFieldContent(textualDetails);
        fieldObjectId.setWidth(widthTextFields);
        fieldObjectType.setWidth(widthTextFields);
        fieldRA.setWidth(widthTextFields);
        fieldDEC.setWidth(widthTextFields);
        fieldM.setWidth(widthTextFields);
        fieldConstellation.setWidth(widthTextFields);
        fieldConstellationMeaning.setWidth(widthTextFields);
        fieldYearOfDiscovery.setWidth(widthTextFields);
        fieldDiscoverer.setWidth(widthTextFields);
        fieldLifeSpan.setWidth(widthTextFields);
        
        mainLayout.addComponent(textualDetails);
        
        List<Integer> imageIds = database.getImageIds(objectId);
        if (!imageIds.isEmpty()){
            galleryWidget = new ImageGalleryWidget(database, imageIds);
            mainLayout.addComponent(galleryWidget);
        }
        addComponent(mainLayout);
    }

}
