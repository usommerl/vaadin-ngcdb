package de.htwkleipzig.ngcdb;

import java.awt.Dimension;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.vaadin.data.util.sqlcontainer.query.FreeformQuery;
import com.vaadin.data.util.sqlcontainer.query.FreeformQueryDelegate;

import com.vaadin.terminal.StreamResource;

import oracle.jdbc.OracleResultSet;
import oracle.ord.im.OrdImage;

import com.vaadin.data.util.sqlcontainer.SQLContainer;
import com.vaadin.data.util.sqlcontainer.connection.JDBCConnectionPool;
import com.vaadin.data.util.sqlcontainer.connection.SimpleJDBCConnectionPool;
import com.vaadin.data.util.sqlcontainer.query.TableQuery;
import com.vaadin.data.util.sqlcontainer.query.generator.OracleGenerator;
import com.vaadin.data.util.sqlcontainer.query.generator.SQLGenerator;

@SuppressWarnings("serial")
public class Database implements Serializable {

    private final JDBCConnectionPool connectionPool;
    private final SQLContainer discoverersContainer;
    private final SQLContainer objectTypesContainer;
    private final SQLContainer constellationsContainer;
    private final SQLContainer imageProvidersContainer;
    
    public Database() {
        this.connectionPool = initConnectionPool();
        this.discoverersContainer = queryTable("discoverers");
        this.objectTypesContainer = queryTable("objecttypes");
        this.constellationsContainer = queryTable("constellations");
        this.imageProvidersContainer = queryTable("imageproviders");
    }

    public SQLContainer getDiscoverersContainer() {
        return this.discoverersContainer;
    }

    public SQLContainer getObjectTypesContainer() {
        return this.objectTypesContainer;
    }

    public SQLContainer getConstellationsContainer() {
        return this.constellationsContainer;
    }

    public SQLContainer getImageProvidersContainer() {
        return this.imageProvidersContainer;
    }

    public List<Integer> getImageIds(int objectid) {
        String query = "select imageid from imagerelations where ngcobjectid = "+objectid;
        String resultColumnName = "imageid";
        return getImageIds(query, resultColumnName);
    }

    
    public List<Integer> getImageIds(String query, String resultColumnName) {
       List<Integer> imageIds = new ArrayList<Integer>();
        try {
            Connection conn = connectionPool.reserveConnection();
            Statement stmt = conn.createStatement();
            OracleResultSet resultSet = (OracleResultSet) stmt.executeQuery(query);
            while (resultSet.next()) {
                imageIds.add(resultSet.getInt(resultColumnName));
            }
            stmt.close();
            conn.commit();
            connectionPool.releaseConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageIds;
    }

    
    public Image getImageById(Integer id) {
        Image image = null;
        try {
            Connection conn = connectionPool.reserveConnection();
            Statement stmt = conn.createStatement();
            String query = "select i.*, i.image.getFileFormat() fileformat, i.image.getContentFormat() contentformat, i.image.getSourceName() filename, i.image.getMimeType() mimetype from images i where id = "+ id;
            OracleResultSet resultSet = (OracleResultSet) stmt.executeQuery(query);
            resultSet.next();
            OrdImage ordImage = (OrdImage) resultSet.getORAData("image", OrdImage.getORADataFactory());
            byte[] imageBytes = ordImage.getDataInByteArray();
            Dimension dimension = new Dimension(ordImage.getWidth(), ordImage.getHeight());
            String description = resultSet.getString("description");
            String fileFormat = resultSet.getString("fileformat");
            String contentFormat = resultSet.getString("contentformat");
            String filename = resultSet.getString("filename");
            String mimeType = resultSet.getString("mimetype");
            image = new Image(resultSet.getInt("id"), imageBytes, dimension, description, fileFormat, contentFormat, filename, mimeType);           
            stmt.close();
            conn.commit();
            connectionPool.releaseConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }       
        return image;
    }
    
    public StreamResource getImageResource(int imageID) {
        StreamResource imageRessource;
        Image image = getImageById(imageID);
        imageRessource = new StreamResource(image, image.getFilename(), NgcdbApplication.getInstance());
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String filename = "filename-" + df.format(new Date());
        imageRessource.setFilename(filename);
        imageRessource.setCacheTime(500);
        return imageRessource;
    }
 
    public ImageProvider getImageProvider(Integer imageId) {
        ImageProvider provider = null;
        try {
            Connection conn = connectionPool.reserveConnection();
            Statement stmt = conn.createStatement();
            String query = "select p.* from imageproviders p, images i where i.id = "+imageId+" and p.abbr = i.providerid";
            OracleResultSet resultSet = (OracleResultSet) stmt.executeQuery(query);
            resultSet.next();
            provider = new ImageProvider(resultSet.getString("abbr"), resultSet.getString("fullname"));
            stmt.close();
            conn.commit();
            connectionPool.releaseConnection(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return provider;
    }

    private JDBCConnectionPool initConnectionPool() {
        JDBCConnectionPool connectionPool = null;
        try {
           connectionPool = new SimpleJDBCConnectionPool(
                    "oracle.jdbc.driver.OracleDriver",
                    "jdbc:oracle:thin:@//ora10glv.imn.htwk-leipzig.de:1521/ora10glv", "MMDB10", "pass#mmdb10", 2, 5);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connectionPool;
    }

    private SQLContainer queryTable(String tableName) {
        SQLContainer container = null;
        try {
            SQLGenerator generator = new OracleGenerator();
            TableQuery query = new TableQuery(tableName, this.connectionPool, generator);
            container = new SQLContainer(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return container;
    }

    public SQLContainer freeFormQuery(String queryString,FreeformQueryDelegate queryDelegate,String ... primaryKeyColumns) {
       SQLContainer container = null;
       try {
          FreeformQuery query = new FreeformQuery(queryString,this.connectionPool, primaryKeyColumns);
          query.setDelegate(queryDelegate);
          container = new SQLContainer(query);
       } catch (SQLException e) {
            e.printStackTrace();
       }
       return container;
    }
}
