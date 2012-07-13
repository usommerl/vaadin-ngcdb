package de.htwkleipzig.ngcdb;

import java.awt.Dimension;
import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.vaadin.terminal.StreamResource.StreamSource;

public class Image implements StreamSource {
    
    private static final long serialVersionUID = -6039565533760151108L;
    private final Integer id;
    private final byte[] imageDataInByteArray;
    private final Dimension dimension;
    private final String fileFormat;
    private final String contentFormat;
    private final String description;
    private final String filename;
    private final String mimeType;

    public Image(Integer id, byte[] imageDataInByteArray, Dimension dimension, String description, String fileFormat, String contentFormat, String filename, String mimeType) {
        this.id = id;
        this.imageDataInByteArray = imageDataInByteArray;
        this.dimension = dimension;
        this.description = description;
        this.fileFormat = fileFormat;
        this.contentFormat = contentFormat;
        this.filename = filename;
        this.mimeType = mimeType;
    }

    public InputStream getStream() {
        return new ByteArrayInputStream(imageDataInByteArray);
    }

    public Integer getId() {
        return id;
    }
    
    public String getFileFormat() {
        return this.fileFormat;
    }

    public String getContentFormat() {
        return this.contentFormat;
    }

    public String getDescription() {
        return this.description;
    }

    public String getFilename() {
        return this.filename;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public int getWidth() {
        return dimension.width;
    }
    public int getHeight() {
        return dimension.height;
    }
    
    public boolean isLandscapeOrientation() {
        return dimension.width > dimension.height;
    }
    public int binaryDataLength() {
        return imageDataInByteArray.length;
    }
}
