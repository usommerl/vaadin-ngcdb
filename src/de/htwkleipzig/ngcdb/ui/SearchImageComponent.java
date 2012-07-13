package de.htwkleipzig.ngcdb.ui;

import com.vaadin.terminal.Sizeable;

import com.vaadin.ui.Form;
import com.vaadin.ui.HorizontalLayout;

import de.htwkleipzig.ngcdb.Database;
import static de.htwkleipzig.ngcdb.Constants.*;

public class SearchImageComponent extends HorizontalLayout implements ClickShortcutRegistrar {

    static final long serialVersionUID = 2L;
    private SearchImageForm searchForm;
    private ImagePagerComponent imagePager;
    private final Database database;
   
    public SearchImageComponent(Database database) {
        this.database = database;
        layout();
    }

    private void layout() {
        searchForm = new SearchImageForm(this);
        searchForm.setWidth(FORM_WIDTH, Sizeable.UNITS_PIXELS);
        imagePager = new ImagePagerComponent(this);
        imagePager.setWidth(RESULTS_WIDTH, Sizeable.UNITS_PIXELS);
        addComponent(searchForm);
        addComponent(imagePager);
        addStyleName(getClass().getSimpleName().toString());
    }

    public ImagePagerComponent getImagePager(){
        return this.imagePager;
    }

    public void registerClickShortcuts() {
        searchForm.registerClickShortcuts();
        imagePager.registerClickShortcuts();
    }

    public void deregisterClickShortcuts() {
        searchForm.deregisterClickShortcuts();
        imagePager.deregisterClickShortcuts();
    }

    public Database getDatabase() {
        return this.database;
    }

    public Form getForm() {
        return this.searchForm;
    }

}
