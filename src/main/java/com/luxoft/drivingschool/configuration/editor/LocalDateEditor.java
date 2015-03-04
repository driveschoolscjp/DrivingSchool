package com.luxoft.drivingschool.configuration.editor;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.beans.PropertyEditorSupport;

public class LocalDateEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        if (text == null) {
            setValue(null);
        } else {
            String value = text.trim();
            if ("".equals(value)) {
                setValue(null);
            } else {
                DateTimeFormatter jodaDateFormatter = getJodaDateFormatter();
                LocalDate result = jodaDateFormatter.parseLocalDate(text);
                setValue(result);
            }
        }
    }

    @Override
    public String getAsText() {
        Object value = getValue();
        if (value == null) {
            return "";
        } else {
            DateTimeFormatter jodaDateFormatter = getJodaDateFormatter();
            LocalDate localDate = (LocalDate) value;
            return jodaDateFormatter.print(localDate.toDate().getTime());
        }
    }

    private DateTimeFormatter getJodaDateFormatter() {
        return DateTimeFormat.forPattern("yyyy-MM-dd");
    }
}