package de.htwkleipzig.ngcdb;

import java.sql.Connection;
import java.sql.SQLException;

import java.util.List;

import com.vaadin.data.Container.Filter;
import com.vaadin.data.util.sqlcontainer.RowItem;
import com.vaadin.data.util.sqlcontainer.SQLUtil;
import com.vaadin.data.util.sqlcontainer.query.FreeformStatementDelegate;
import com.vaadin.data.util.sqlcontainer.query.OrderBy;
import com.vaadin.data.util.sqlcontainer.query.generator.StatementHelper;
import com.vaadin.data.util.sqlcontainer.query.generator.filter.QueryBuilder;

@SuppressWarnings("serial")
public class OracleReadOnlyDelegate implements FreeformStatementDelegate {

    private List<Filter> filters;
    private List<OrderBy> orderBys;
    private final String queryString;

    public OracleReadOnlyDelegate(String queryString) {
        this.queryString = queryString;
    }

    public StatementHelper getQueryStatement(int offset, int limit)
            throws UnsupportedOperationException {
        StatementHelper sh = new StatementHelper();
        StringBuffer query = new StringBuffer("select * from (" + queryString
                + ")");
        if (filters != null) {
            query.append(QueryBuilder.getWhereStringForFilters(filters, sh));
        }
        query.append(getOrderByString());
        if (offset != 0 || limit != 0) {
            StringBuffer limitQuery = new StringBuffer(
                    "SELECT x.* FROM (SELECT y.*, rownum y_rownum FROM ("
                            + query.toString() + ") y ");
            limitQuery.append("WHERE rownum <= " + (offset + limit) + ") x ");
            limitQuery.append("WHERE y_rownum >= " + offset);
            query = limitQuery;
        }
        sh.setQueryString(query.toString());
        return sh;
    }

    private String getOrderByString() {
        StringBuffer orderBuffer = new StringBuffer("");
        if (orderBys != null && !orderBys.isEmpty()) {
            orderBuffer.append(" ORDER BY ");
            OrderBy lastOrderBy = orderBys.get(orderBys.size() - 1);
            for (OrderBy orderBy : orderBys) {
                orderBuffer.append(SQLUtil.escapeSQL(orderBy.getColumn()));
                if (orderBy.isAscending()) {
                    orderBuffer.append(" ASC");
                } else {
                    orderBuffer.append(" DESC");
                }
                if (orderBy != lastOrderBy) {
                    orderBuffer.append(", ");
                }
            }
        }
        return orderBuffer.toString();
    }

    public StatementHelper getCountStatement()
            throws UnsupportedOperationException {
        StatementHelper sh = new StatementHelper();
        StringBuffer query = new StringBuffer("select count(*) from ("
                + queryString + ")");
        if (filters != null) {
            query.append(QueryBuilder.getWhereStringForFilters(filters, sh));
        }
        sh.setQueryString(query.toString());
        return sh;
    }

    public StatementHelper getContainsRowQueryStatement(Object... keys)
            throws UnsupportedOperationException {
        StatementHelper sh = new StatementHelper();
        StringBuffer query = new StringBuffer("select * from (" + queryString
                + ") where rownum = ?");
        sh.addParameterValue(keys[0]);
        sh.setQueryString(query.toString());
        return sh;
    }

    public void setFilters(List<Filter> filters)
            throws UnsupportedOperationException {
        this.filters = filters;
    }

    public void setOrderBy(List<OrderBy> orderBys)
            throws UnsupportedOperationException {
        this.orderBys = orderBys;
    }

    public int storeRow(Connection conn, RowItem row)
            throws UnsupportedOperationException, SQLException {
        throw new UnsupportedOperationException("No write support");
    }

    public boolean removeRow(Connection conn, RowItem row)
            throws UnsupportedOperationException, SQLException {
        throw new UnsupportedOperationException("No write support");
    }

    public String getContainsRowQueryString(Object... keys)
            throws UnsupportedOperationException {
        throw new UnsupportedOperationException(
                "Please use getContainsRowQueryStatement method.");
    }

    public String getQueryString(int offset, int limit)
            throws UnsupportedOperationException {
        throw new UnsupportedOperationException("Use getQueryStatement method.");
    }

    public String getCountQuery() throws UnsupportedOperationException {
        throw new UnsupportedOperationException("Use getQueryStatement method.");
    }
}
