package de.htwkleipzig.ngcdb.ui;

import java.util.Iterator;

import com.vaadin.terminal.Sizeable;
import com.vaadin.terminal.StreamResource;

import com.vaadin.ui.Component;
import com.vaadin.ui.Embedded;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.TextField;
import static java.lang.Math.max;

import static de.htwkleipzig.ngcdb.Constants.NULL_REPRESENTATION;
import de.htwkleipzig.ngcdb.Image;

public class UiUtils {

    public static String calculateSizeAccordingToTextFieldContent(FormLayout formLayout) {
        int maxLength = 0;
        for (Iterator<Component> it = formLayout.getComponentIterator(); it.hasNext();) {
            Component component = it.next();
            if (component instanceof TextField) {
                int length = saveConvert(((TextField) component).getValue(), NULL_REPRESENTATION).length();
                maxLength = max(length, maxLength);
            }
        }
        double value = ((float)maxLength)/1.85;
        if (value < 10.0) {value = 10.0;}
        return String.format("%.1fem",value);
    }

    public static String saveConvert(Object obj) {
        return saveConvert(obj, "");
    }

    public static String saveConvert(Object obj, String nullRepresentation) {
        if (obj == null) {
            return nullRepresentation;
        } else {
            return obj.toString();
        }
    }

    public static String formatNegativeYear(Object year) {
        String yearString = saveConvert(year);
        if (yearString.startsWith("-")) {
            yearString = yearString.substring(1)+" B.C.";
        }
        return yearString;
    }
    
    public static String concatIfNotEmpty(String prefix, String separator, String suffix) {
        if (prefix.length() == 0 && suffix.length() == 0) {
            return "";
        } else if (prefix.length() > 0 && suffix.length() == 0) {
            return prefix;
        } else if (prefix.length() == 0 && suffix.length() > 0) {
            return suffix;
        } 
        return String.format("%s%s%s", prefix, separator, suffix);    
    }
	
    public static void setSizeAccordingToOrientation(Embedded embedded, int maxImageSize) {
		Image image = ((Image)((StreamResource) embedded.getSource()).getStreamSource());
        if (image.isLandscapeOrientation()) {
            float ratio = ((float)image.getWidth())/image.getHeight();
            String shortEdgeSize = String.format("%dpx", Math.round(maxImageSize/ratio));
			embedded.setWidth(maxImageSize, Sizeable.UNITS_PIXELS);
            embedded.setHeight(shortEdgeSize);
		} else {
            float ratio = ((float)image.getHeight())/image.getWidth();
            String shortEdgeSize = String.format("%dpx", Math.round(maxImageSize/ratio));
			embedded.setHeight(maxImageSize, Sizeable.UNITS_PIXELS);
            embedded.setWidth(shortEdgeSize);
		}
	}
}
