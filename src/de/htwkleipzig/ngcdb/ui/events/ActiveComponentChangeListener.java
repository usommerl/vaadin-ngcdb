package de.htwkleipzig.ngcdb.ui.events;

import com.vaadin.ui.Component.Event;
import com.vaadin.ui.Component.Listener;

@SuppressWarnings("serial")
public abstract class ActiveComponentChangeListener implements Listener {

    public void componentEvent(Event event) {
        if (event instanceof ActiveComponentChangeEvent) {
            activeComponentChange((ActiveComponentChangeEvent) event);
        }
    }

    public abstract void activeComponentChange(ActiveComponentChangeEvent event);

}
