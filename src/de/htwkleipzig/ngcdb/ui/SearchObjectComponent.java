package de.htwkleipzig.ngcdb.ui;

import com.vaadin.data.Item;
import com.vaadin.data.Property;
import com.vaadin.data.util.sqlcontainer.SQLContainer;
import com.vaadin.event.ItemClickEvent;
import com.vaadin.event.ItemClickEvent.ItemClickListener;
import com.vaadin.event.ShortcutAction.KeyCode;
import com.vaadin.event.ShortcutAction.ModifierKey;
import com.vaadin.event.ShortcutListener;
import com.vaadin.terminal.Sizeable;
import com.vaadin.ui.AbstractField.FocusShortcut;
import com.vaadin.ui.Form;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Table;
import com.vaadin.ui.Window;
import com.vaadin.ui.Window.CloseEvent;
import com.vaadin.ui.Window.CloseListener;
import static com.vaadin.ui.Window.Notification.*;
import static de.htwkleipzig.ngcdb.Constants.*;
import de.htwkleipzig.ngcdb.Database;
import de.htwkleipzig.ngcdb.OracleReadOnlyDelegate;

public class SearchObjectComponent extends HorizontalLayout implements ClickShortcutRegistrar {

    static final long serialVersionUID = 1L;
    private Table resultsTable;
    private SearchObjectForm searchForm;
    private final SQLContainer resultsTableContainer;
    private final Database database;

    public SearchObjectComponent(Database database) {
        this.database = database;
        String[] primaryKeyColumns = new String[] {PROP_OBJECTID};
        String query = "select * from view_searchObjectComponent";
        OracleReadOnlyDelegate queryDelegate = new OracleReadOnlyDelegate(query);
        this.resultsTableContainer = database.freeFormQuery(query,queryDelegate,primaryKeyColumns); 
        layout();
        registerListeners();
    }

    private void layout() {
        resultsTable = new Table(null, this.resultsTableContainer) {
            static final long serialVersionUID = 1001L;
            @Override
            protected String formatPropertyValue(Object rowId, Object colId, Property property) {
                if (colId.equals(PROP_OBJECTID)) {
                    return "NGC "+property.getValue().toString();
                } else if (colId.equals(PROP_YEAR_OF_DISCOVERY)) {
                    return UiUtils.formatNegativeYear(property.getValue());
                }
                return super.formatPropertyValue(rowId, colId, property);
            }
        };
        searchForm = new SearchObjectForm(this);
        addStyleName(getClass().getSimpleName().toString());
        addComponent(searchForm);
        addComponent(resultsTable);
        searchForm.setWidth(FORM_WIDTH, Sizeable.UNITS_PIXELS);
        resultsTable.setWidth(RESULTS_WIDTH, Sizeable.UNITS_PIXELS);
        resultsTable.setSelectable(true);
        resultsTable.setVisibleColumns(new Object[]{PROP_OBJECTID,PROP_OBJECTTYPE,PROP_CONSTELLATION,PROP_YEAR_OF_DISCOVERY});
        resultsTable.setColumnHeaders(new String[]{"Object", "Type", CONSTELLATION, YEAR_OF_DISCOVERY});
        resultsTable.setColumnWidth(PROP_OBJECTID, 70);
        resultsTable.setColumnWidth(PROP_YEAR_OF_DISCOVERY, 120);
        resultsTable.setPageLength(10);
        resultsTable.setFooterVisible(true);
        resultsTable.setNullSelectionAllowed(false);
        disableResultsTable(null);
    }

    private void registerListeners() {
        resultsTable.addListener(new ItemClickListener() {
            static final long serialVersionUID = 101L;
            public void itemClick(ItemClickEvent event) {
                if (event.isDoubleClick()) {
                    Item item = event.getItem();
                    showDetails(item);
                }
            }
        });
    }

    public void disableResultsTable(String message) {
        SQLContainer container = (SQLContainer) resultsTable.getContainerDataSource();
        container.addContainerFilter(PROP_OBJECTID,"-1",true,true);
        resultsTable.setColumnFooter(PROP_OBJECTID, "");
        resultsTable.setEnabled(false);
        if ( message != null) { 
            Window.Notification notification = new Window.Notification(message, TYPE_HUMANIZED_MESSAGE);
            notification.setPosition(POSITION_CENTERED_BOTTOM);
            getWindow().showNotification(notification);
        }
    }

    public void enableResultsTable() {
        SQLContainer container = (SQLContainer) resultsTable.getContainerDataSource();
        if (container.size() > 0) { 
            resultsTable.setEnabled(true);
            resultsTable.focus();
            String footerMessage = container.size() > 1 ? container.size()+" matches" : container.size()+" match";
            resultsTable.setColumnFooter(PROP_OBJECTID, footerMessage);
            resultsTable.setSortContainerPropertyId(PROP_OBJECTID);
            resultsTable.setValue(resultsTable.firstItemId());
        } else {
            disableResultsTable("No match");
        }
    }

    private void showDetails(Item item) {
        DetailsWindowObject detailsWindow = new DetailsWindowObject(item, this.database);
        detailsWindow.addListener(new CloseListener() {
            static final long serialVersionUID = 102L;
            public void windowClose(CloseEvent e) {
                resultsTable.focus(); 
            }
        });
        getApplication().getMainWindow().addWindow(detailsWindow);
    }

    public void registerClickShortcuts() {
        searchForm.registerClickShortcuts();
        resultsTable.addShortcutListener(new FocusShortcut(resultsTable,KeyCode.R, new int[] {ModifierKey.SHIFT, ModifierKey.ALT}));
        resultsTable.addShortcutListener(new ShortcutListener("", KeyCode.ENTER, new int[] {ModifierKey.SHIFT}) {
            static final long serialVersionUID = 103L;
            @Override
            public void handleAction(Object sender, Object target) {
				Object selected = resultsTable.getValue();
				if (resultsTable.isEnabled() && selected != null) {
					Item item = resultsTable.getContainerDataSource().getItem(selected);
					showDetails(item);
				}
            }
        });
    }

    public void deregisterClickShortcuts() {
        searchForm.deregisterClickShortcuts();
        resultsTable.removeAllActionHandlers();
    }

    public Table getResultsTable() {
        return this.resultsTable;
    }

    public Database getDatabase() {
        return this.database;
    }
    
    public Form getForm() {
        return this.searchForm;
    }
}

