package com.g2ssid.ddh_g2ssid_api.report.specification.generic;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author giovanny delgadillo
 */
public class SearchCriteria {

    public static final String EQUAL =  ":";
    public static final String GREATER_THAN = ">";
    public static final String LESS_THAN = "<";
    public static final String DELIMITER = ",";
    public static final String SEARCH_PATTERN = "(\\w*)\\[?(:|<|>|\\w*)\\]?([\\w-;]+),?";
    public static final String SEARCH_PARAM_NAME = "search";
    public static final String BETWEEN = "between";

    private String field;
    private String operator;
    private String value;
    private List<SearchCriteria> filters;

    public SearchCriteria(){
        filters = new ArrayList<>();
    }

    public SearchCriteria(String field, String operator, String value) {
        this.field = field;
        this.operator = operator;
        this.value = value;
        filters = new ArrayList<>();
    }

    public static List<SearchCriteria> parse(String queryString) {
        Pattern pattern = Pattern.compile(SEARCH_PATTERN);
        Matcher matcher = pattern.matcher(queryString + DELIMITER);
        List<SearchCriteria> filters = new ArrayList<>();
        while (matcher.find()) {
            filters.add(new SearchCriteria(matcher.group(1), matcher.group(2), matcher.group(3)));
        }
        return filters;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public List<SearchCriteria> getFilters() {
        return filters;
    }

    public void setFilters(List<SearchCriteria> filters) {
        this.filters = filters;
    }
}
