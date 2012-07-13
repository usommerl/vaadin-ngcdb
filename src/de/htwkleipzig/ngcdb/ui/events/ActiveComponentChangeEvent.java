package de.htwkleipzig.ngcdb.ui.events;

import com.vaadin.ui.Component;
import com.vaadin.ui.Component.Event;

@SuppressWarnings("serial")
public class ActiveComponentChangeEvent extends Event {
	
	public ActiveComponentChangeEvent(Component component) {
		super(component);
	}

}
