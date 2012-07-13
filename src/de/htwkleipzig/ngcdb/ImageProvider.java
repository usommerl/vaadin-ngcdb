package de.htwkleipzig.ngcdb;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ImageProvider implements Serializable {

    private final String abbr;
    private final String fullname;

    public ImageProvider(String abbr, String fullname) {
        this.abbr = abbr;
        this.fullname = fullname;
    }

    public String getAbbr() {
        return this.abbr;
    }

    public String getFullname() {
        return this.fullname;
    }

}
