package de.htwkleipzig.ngcdb;

public final class Constants {

    public static final int OBJECTID_MIN_VALUE = 1;
    public static final int OBJECTID_MAX_VALUE = 7840;
    public static final int FORM_WIDTH = 345;
    public static final int RESULTS_WIDTH = 570;
    public static final int MAX_IMAGE_SIZE_LARGE = 310;
    public static final int SPACER_SIZE_LARGE = 20;
    
    // Strings Interface
    public static final String SEPARATOR = ":";
    public static final String NULL_REPRESENTATION = "n/a";
    
    public static final String SEARCH = "Search";
    public static final String RESET = "Clear";
    public static final String OBJECTID = "NGC ID";
    public static final String OBJECTTYPE = "Object Type";
    public static final String CONSTELLATION = "Constellation";
    public static final String DISCOVERER = "Discoverer";
    public static final String IMAGEPROVIDER = "Image Provider";
    public static final String TEXT_SEARCH = "Description Contains";
    public static final String YEAR_OF_DISCOVERY = "Year of Discovery";
    public static final String RA = "Right Ascension";
    public static final String DEC = "Declination";
    public static final String M = "Apparent Magnitude";
    public static final String ERR_MESSAGE_OBJECTID = OBJECTID+" has to be an Integer between "+OBJECTID_MIN_VALUE+" and "+OBJECTID_MAX_VALUE;
    public static final String DIMENSIONS = "Dimensions";
    public static final String FORMAT = "Format";
    public static final String PROVIDER = "Provider";

    // Property Identifiers
    public static final String PROP_OBJECTID = "NGCID";
    public static final String PROP_OBJECTTYPE = "OBJECTTYPE";
    public static final String PROP_OBJECTTYPEID = "OID";
    public static final String PROP_DISCOVERERID = "DID";
    public static final String PROP_CONSTELLATION = "CONSTELLATION";
    public static final String PROP_CONSTELLATIONID = "CID";
    public static final String PROP_CONSTELLATION_MEANING = "MEANING";
    public static final String PROP_YEAR_OF_DISCOVERY = "YEAROFDISCOVERY";
    public static final String PROP_FIRSTNAME = "FIRSTNAME";
    public static final String PROP_LASTNAME = "LASTNAME";
    public static final String PROP_MIDDLENAMES = "MIDDLENAMES";
    public static final String PROP_YEAR_OF_BIRTH = "YEAROFBIRTH";
    public static final String PROP_YEAR_OF_DEATH = "YEAROFDEATH";
    public static final String PROP_RA = "RA";
    public static final String PROP_DEC = "DEC";
    public static final String PROP_M = "M";

}
