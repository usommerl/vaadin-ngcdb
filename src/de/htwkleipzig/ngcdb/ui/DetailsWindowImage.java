package de.htwkleipzig.ngcdb.ui;

import com.vaadin.event.ShortcutAction.KeyCode;

import com.vaadin.terminal.Sizeable;
import com.vaadin.terminal.StreamResource;

import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Embedded;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.TextArea;
import com.vaadin.ui.TextField;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Window;
import static de.htwkleipzig.ngcdb.Constants.*;
import de.htwkleipzig.ngcdb.Database;
import de.htwkleipzig.ngcdb.DynamicStreamResource;
import de.htwkleipzig.ngcdb.Image;
import de.htwkleipzig.ngcdb.ImageProvider;
import com.vaadin.ui.Alignment;

@SuppressWarnings("serial")
public class DetailsWindowImage extends Window {

    private HorizontalLayout mainLayout;
    private VerticalLayout columnA;
    private VerticalLayout columnB;
    private Embedded embedded;
    private final StreamResource streamResource;
    private TextArea fieldDescription;
    private Label spacer1;
    private FormLayout layoutImageDetails;
    private TextField fieldDimensions;
    private TextField fieldFormat;
    private TextField fieldProvider;
    private Button btnDownload;
    private final Image image;
    private final ImageProvider provider;
    
    public DetailsWindowImage(StreamResource resource, Database database) {
        super("Image Details");
        this.streamResource = resource;
        this.image = (Image) streamResource.getStreamSource();
        this.provider = database.getImageProvider(image.getId());
        layout();
        setModal(true);
        setResizable(false);
        getContent().setSizeUndefined();
        center();
        setCloseShortcut(KeyCode.ESCAPE);
        fieldDimensions.focus();
        btnDownload.addListener(new Button.ClickListener(){
			public void buttonClick(ClickEvent event) {
                Image image = (Image) streamResource.getStreamSource();
                DynamicStreamResource dynResource = new DynamicStreamResource(image,image.getFilename(),btnDownload.getApplication());
                btnDownload.getApplication().getMainWindow().open(dynResource, "_top");
			}
        });
    }

    private void layout() {
        mainLayout = new HorizontalLayout();
        columnA = new VerticalLayout();
        embedded = new Embedded(null, streamResource); 
        embedded.setType(Embedded.TYPE_IMAGE);
        UiUtils.setSizeAccordingToOrientation(embedded, 450);
        
        columnA.addComponent(embedded);
        mainLayout.addComponent(columnA);

        layoutImageDetails = new FormLayout();
        layoutImageDetails.addStyleName("ReadOnlyForm2");
        fieldDimensions = new TextField(DIMENSIONS+SEPARATOR);
        fieldDimensions.setNullRepresentation(NULL_REPRESENTATION);
        fieldDimensions.setValue(String.format("%d x %d", image.getWidth(), image.getHeight()));
        fieldDimensions.setReadOnly(true);
        fieldFormat = new TextField(FORMAT+SEPARATOR);
        fieldFormat.setNullRepresentation(NULL_REPRESENTATION);
        fieldFormat.setValue(String.format("%s / %s", image.getContentFormat(), image.getFileFormat()));
        fieldFormat.setReadOnly(true);
        fieldProvider = new TextField(PROVIDER+SEPARATOR);
        fieldProvider.setNullRepresentation(NULL_REPRESENTATION);
        fieldProvider.setValue(provider.getFullname());
        fieldProvider.setReadOnly(true);

        layoutImageDetails.addComponent(fieldDimensions);
        layoutImageDetails.addComponent(fieldFormat);
        layoutImageDetails.addComponent(fieldProvider);

        String fieldWidth = UiUtils.calculateSizeAccordingToTextFieldContent(layoutImageDetails);
        fieldDimensions.setWidth(fieldWidth);
        fieldFormat.setWidth(fieldWidth);
        fieldProvider.setWidth(fieldWidth);
        btnDownload = new Button("Download");
        btnDownload.addStyleName("download");
        
        spacer1 = new Label();
        spacer1.setWidth(15, Sizeable.UNITS_PIXELS);
        mainLayout.addComponent(spacer1);
        columnB = new VerticalLayout();
        String description = ((Image) streamResource.getStreamSource()).getDescription();
        if (description != null && description.length() > 0) {
            fieldDescription = new TextArea(null, description);
        }else {
            fieldDescription = new TextArea(null, "");
        }
        fieldDescription.setReadOnly(true);
        fieldDescription.setSizeFull();
        Label labelDescription = new Label("Description:");
        labelDescription.addStyleName("imageDescription");
        columnB.setWidth(400, Sizeable.UNITS_PIXELS);
        columnB.addComponent(labelDescription);
        columnB.addComponent(fieldDescription);
        HorizontalLayout layoutButtonAndImageDetails = new HorizontalLayout();
        layoutButtonAndImageDetails.setWidth(100, Sizeable.UNITS_PERCENTAGE);
        layoutButtonAndImageDetails.addComponent(layoutImageDetails);
        layoutButtonAndImageDetails.addComponent(btnDownload);
        layoutButtonAndImageDetails.setExpandRatio(layoutImageDetails, 1.0f);
        layoutButtonAndImageDetails.setComponentAlignment(btnDownload, Alignment.TOP_LEFT);
        
        columnB.addComponent(layoutButtonAndImageDetails);
        columnB.setHeight(100, Sizeable.UNITS_PERCENTAGE);
        columnB.setExpandRatio(fieldDescription,1.0f);

        mainLayout.addComponent(columnB);
        mainLayout.addStyleName(getClass().getSimpleName());
        addComponent(mainLayout);
    }
}
