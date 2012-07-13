package de.htwkleipzig.ngcdb.ui;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import com.vaadin.data.Container;
import com.vaadin.data.Container.Filter;
import com.vaadin.data.Container.ItemSetChangeEvent;
import com.vaadin.data.Item;
import com.vaadin.data.Validator.InvalidValueException;
import com.vaadin.data.util.filter.Compare;
import com.vaadin.data.util.sqlcontainer.SQLContainer;
import com.vaadin.event.ShortcutAction.KeyCode;
import static com.vaadin.ui.AbstractSelect.*;
import static com.vaadin.ui.AbstractSelect.Filtering.*;
import com.vaadin.ui.Alignment;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.Form;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Label;
import com.vaadin.ui.TextField;
import static de.htwkleipzig.ngcdb.Constants.*;

public class SearchObjectForm extends Form implements ClickShortcutRegistrar{

    static final long serialVersionUID = 11L;
    private final static String WIDTH_FORM_ELEMENTS = "100%"; 
    private final static int YEAR_OF_DISCOVERY_MIN_VALUE = -1000; 
    private final static int YEAR_OF_DISCOVERY_MAX_VALUE = Calendar.getInstance().get(Calendar.YEAR); 
    private final static String ERR_MESSAGE_YEAR_OF_DISCOVERY = 
        YEAR_OF_DISCOVERY+" hast to be an Integer between "+YEAR_OF_DISCOVERY_MIN_VALUE+" and "+YEAR_OF_DISCOVERY_MAX_VALUE; 
    private TextField fieldObjectID;
    private TextField fieldYearOfDiscovery;
    private ComboBox selectObjecttype;
    private ComboBox selectConstellation;
    private ComboBox selectDiscoverer;
    private HorizontalLayout layoutButtons;
    private Button btnSearch;
    private Button btnReset;
    private final SearchObjectComponent rootComponent;

    public SearchObjectForm(SearchObjectComponent rootComponent) {
        this.rootComponent = rootComponent;
        layout();
        registerListeners();
    }

    private void registerListeners() {
        btnSearch.addListener(new Button.ClickListener() {
            static final long serialVersionUID = 111L;
            public void buttonClick(ClickEvent event) {
                    try {
                        validate();
                        getResultTableContainer().removeAllContainerFilters();
                        List<Filter> filterList = new ArrayList<Filter>();
                        if (!fieldObjectID.getValue().toString().isEmpty()) {
                            Filter filter = new Compare.Equal(PROP_OBJECTID,fieldObjectID.getValue());
                            filterList.add(filter);
                        }
                        if (selectObjecttype.getValue() != null) {
                            Object value = selectObjecttype.getItem(selectObjecttype.getValue()).getItemProperty("ID").getValue();
                            Filter filter = new Compare.Equal(PROP_OBJECTTYPEID, value);
                            filterList.add(filter); 
                        }
                        if (selectDiscoverer.getValue() != null) {
                            Object value = selectDiscoverer.getItem(selectDiscoverer.getValue()).getItemProperty("ID").getValue();
                            Filter filter = new Compare.Equal(PROP_DISCOVERERID, value);
                            filterList.add(filter); 
                        }
                        if (selectConstellation.getValue() != null) {
                            Object value = selectConstellation.getItem(selectConstellation.getValue()).getItemProperty("ABBR").getValue();
                            Filter filter = new Compare.Equal(PROP_CONSTELLATIONID, value);
                            filterList.add(filter); 
                        }
                        if (!fieldYearOfDiscovery.getValue().toString().isEmpty()){
                            Filter filter = new Compare.Equal(PROP_YEAR_OF_DISCOVERY,fieldYearOfDiscovery.getValue());
                            filterList.add(filter); 
                        }

                        if (filterList.isEmpty()) {
                            rootComponent.disableResultsTable(null);
                        } else {
                            for (Filter filter : filterList) {
                                getResultTableContainer().addContainerFilter(filter);
                            }
                            rootComponent.enableResultsTable();
                        }
                    } catch (InvalidValueException e) { /* do nothing */ }
			}
		});

        btnReset.addListener(new Button.ClickListener(){
            static final long serialVersionUID = 112L;
            public void buttonClick(ClickEvent event) {
			    fieldObjectID.setValue("");
                selectObjecttype.setValue(null);
                selectConstellation.setValue(null);
                selectDiscoverer.setValue(null);
			    fieldYearOfDiscovery.setValue("");
                rootComponent.disableResultsTable(null);
                fieldObjectID.focus();
			}
        
        });
        
        selectDiscoverer.addListener(new ItemSetChangeListener(){
            static final long serialVersionUID = 113L;
            public void containerItemSetChange(ItemSetChangeEvent event) {
                Container container = event.getContainer();
		        for(Iterator<?> it = container.getItemIds().iterator(); it.hasNext();) {
                    String caption = "";
                    Object itemID = it.next();
                    Item item = container.getItem(itemID);
                    caption = UiUtils.concatIfNotEmpty(caption," ",UiUtils.saveConvert(item.getItemProperty(PROP_FIRSTNAME).getValue()));
                    caption = UiUtils.concatIfNotEmpty(caption," ",UiUtils.saveConvert(item.getItemProperty(PROP_LASTNAME).getValue()));
                    selectDiscoverer.setItemCaption(itemID, caption);
                }		
			}
        });
    }


    private SQLContainer getResultTableContainer() {
        return (SQLContainer) rootComponent.getResultsTable().getContainerDataSource();
    }

    private void layout() {
        setWidth("100%");
        setValidationVisible(true);
        fieldObjectID = new TextField(OBJECTID);
        fieldObjectID.addValidator(new IntegerRangeValidator(OBJECTID_MIN_VALUE,OBJECTID_MAX_VALUE,ERR_MESSAGE_OBJECTID));
        fieldObjectID.setWidth(WIDTH_FORM_ELEMENTS);
        selectObjecttype = new ComboBox(OBJECTTYPE, rootComponent.getDatabase().getObjectTypesContainer());
        selectObjecttype.setItemCaptionPropertyId("NAME");
        selectObjecttype.setWidth(WIDTH_FORM_ELEMENTS);
        selectObjecttype.setFilteringMode(FILTERINGMODE_CONTAINS);
        selectConstellation = new ComboBox(CONSTELLATION, rootComponent.getDatabase().getConstellationsContainer());
        selectConstellation.setWidth(WIDTH_FORM_ELEMENTS);
        selectConstellation.setItemCaptionPropertyId("NAME");
        selectConstellation.setFilteringMode(FILTERINGMODE_CONTAINS);
        selectDiscoverer = new ComboBox(DISCOVERER, rootComponent.getDatabase().getDiscoverersContainer());
        selectDiscoverer.setItemCaptionMode(ITEM_CAPTION_MODE_EXPLICIT);
        selectDiscoverer.setWidth(WIDTH_FORM_ELEMENTS);
        selectDiscoverer.setFilteringMode(FILTERINGMODE_CONTAINS);
        fieldYearOfDiscovery = new TextField(YEAR_OF_DISCOVERY);
        fieldYearOfDiscovery.setWidth(WIDTH_FORM_ELEMENTS);
        fieldYearOfDiscovery.addValidator(new IntegerRangeValidator(YEAR_OF_DISCOVERY_MIN_VALUE,YEAR_OF_DISCOVERY_MAX_VALUE,ERR_MESSAGE_YEAR_OF_DISCOVERY));
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
        addField(CONSTELLATION,selectConstellation);
        addField(DISCOVERER,selectDiscoverer);
        addField(YEAR_OF_DISCOVERY,fieldYearOfDiscovery);
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
