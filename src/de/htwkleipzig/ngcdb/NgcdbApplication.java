package de.htwkleipzig.ngcdb;
 
import com.vaadin.Application;

import com.vaadin.service.ApplicationContext.TransactionListener;

import com.vaadin.ui.Window;

import de.htwkleipzig.ngcdb.ui.MainWindow;

@SuppressWarnings("serial")
public class NgcdbApplication extends Application implements TransactionListener {
    
    private Window mainWindow;
    private Database database = new Database();
    private static ThreadLocal<NgcdbApplication> currentApplication = new ThreadLocal<NgcdbApplication>();
    
    @Override
    public void init() {
        setTheme("customTheme");
        database = new Database();
        mainWindow = new MainWindow(database);
        setMainWindow(mainWindow);
        getContext().addTransactionListener(this);
    }
    
    public static NgcdbApplication getInstance() {
        return currentApplication.get();
    }

    public void transactionStart(Application application, Object transactionData) {
        if (application == this){
            currentApplication.set(this);
        }
    }

    public void transactionEnd(Application application, Object transactionData) {
        if (application == this) {
            currentApplication.set(null);
            currentApplication.remove();
        }
    }
}
