package de.htwkleipzig.ngcdb.ui;

import com.vaadin.event.ShortcutAction.KeyCode;
import com.vaadin.event.ShortcutAction.ModifierKey;

import com.vaadin.event.ShortcutListener;

import com.vaadin.terminal.Sizeable;

import com.vaadin.ui.Alignment;
import com.vaadin.ui.Component;
import com.vaadin.ui.Label;
import com.vaadin.ui.Panel;

import com.vaadin.ui.TabSheet.SelectedTabChangeEvent;
import com.vaadin.ui.TabSheet.SelectedTabChangeListener;
import com.vaadin.ui.TabSheet;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Window;
import com.vaadin.ui.themes.Reindeer;
import de.htwkleipzig.ngcdb.Database;

public class MainWindow extends Window {

    static final long serialVersionUID = 9L;
	private Panel mainLayout;
	private TabSheet tabSheet;
	private SearchObjectComponent searchObjectComponent;
	private SearchImageComponent searchImageComponent;
    private Label applicationHeader;
    private final Database database;

	public MainWindow(Database database){
		super("NGC Database");
        this.database = database;
		setName("app");
		layout();
		registerListeners();
            
        tabSheet.setSelectedTab(searchImageComponent);
        tabSheet.setSelectedTab(searchObjectComponent);
        searchObjectComponent.getForm().focus();
    }
	
	private void layout(){
		mainLayout = new Panel();
        mainLayout.addStyleName(Reindeer.PANEL_LIGHT);
        mainLayout.setWidth(1000, Sizeable.UNITS_PIXELS);
		
        tabSheet = new TabSheet();
		applicationHeader = new Label("<h1>New General Catalogue Database<span>beta version</span></h1>");
        applicationHeader.setContentMode(Label.CONTENT_XHTML);
        applicationHeader.addStyleName("applicationHeader");
        searchObjectComponent = new SearchObjectComponent(database);
        searchImageComponent = new SearchImageComponent(database);

        tabSheet.addTab(searchObjectComponent, "Search Object");
        tabSheet.addTab(searchImageComponent, "Search Image");
		
        mainLayout.addComponent(applicationHeader);
        mainLayout.addComponent(tabSheet);
        tabSheet.setSizeUndefined();
		addComponent(mainLayout);

        VerticalLayout content = (VerticalLayout) getContent();
        content.setSizeFull();
        content.setComponentAlignment(mainLayout, Alignment.TOP_CENTER);
	}
	
	private void registerListeners(){
        tabSheet.addListener(new SelectedTabChangeListener() {
            static final long serialVersionUID = 901L;
			public void selectedTabChange(SelectedTabChangeEvent event) {
                Component selectedComponent = event.getTabSheet().getSelectedTab();
                for(int i = 0; i < tabSheet.getComponentCount(); i++) {
                    Component component = tabSheet.getTab(i).getComponent();
                    if (component.equals(selectedComponent)) {
                        ((ClickShortcutRegistrar) component).registerClickShortcuts();
                    } else {
                        ((ClickShortcutRegistrar) component).deregisterClickShortcuts();
                    }
                }
            }
        });

        mainLayout.addAction(new ShortcutListener("", KeyCode.O, new int[] {ModifierKey.SHIFT, ModifierKey.ALT}) {
            static final long serialVersionUID = 902L;
            @Override
            public void handleAction(Object sender, Object target) {
                tabSheet.setSelectedTab(searchObjectComponent);
                searchObjectComponent.getForm().focus();
            }
        });
        
        mainLayout.addAction(new ShortcutListener("", KeyCode.I, new int[] {ModifierKey.SHIFT, ModifierKey.ALT}) {
            static final long serialVersionUID = 903L;
            @Override
            public void handleAction(Object sender, Object target) {
                tabSheet.setSelectedTab(searchImageComponent);
                searchImageComponent.getForm().focus();
            }
        });
	}
}
