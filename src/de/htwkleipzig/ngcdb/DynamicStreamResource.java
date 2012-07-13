package de.htwkleipzig.ngcdb;

import com.vaadin.Application;
import com.vaadin.terminal.DownloadStream;
import com.vaadin.terminal.StreamResource;

public class DynamicStreamResource extends StreamResource {

  private static final long serialVersionUID = -4304057799149311779L;
  
  private final String binaryDataLength;
  private final String filename;

  public static final String MIME_TYPE_BINARY_DATA = "application/octet-stream";

  public DynamicStreamResource(Image image, final String filename, final Application application) {
    
    super(image,filename,application);
    this.filename = filename;
    this.binaryDataLength = Integer.toString(image.binaryDataLength());
    
    setMIMEType(MIME_TYPE_BINARY_DATA);
  }
  
  @Override
  public DownloadStream getStream() {
    final DownloadStream downloadStream = super.getStream();

    // Set the "attachment" to force save-dialog. Important for IE7 (and probably IE8)
    downloadStream.setParameter("Content-Disposition", "attachment; filename=\"" + filename + "\"");

    // Enable deterministic progressbar for download
    downloadStream.setParameter("Content-Length", binaryDataLength);
    
    return downloadStream;
  }

}
