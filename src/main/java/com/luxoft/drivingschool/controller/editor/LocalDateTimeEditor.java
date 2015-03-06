package com.luxoft.drivingschool.controller.editor;

import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.beans.PropertyEditorSupport;

public class LocalDateTimeEditor extends PropertyEditorSupport {

    @Override
    public void setAsText(String text) {
        if (text == null) {
            setValue(null);
        } else {
            String value = text.trim();
            if ("".equals(value)) {
                setValue(null);
            } else {
                DateTimeFormatter jodaDateTimeFormatter = getJodaDateTimeFormatter();
                LocalDateTime result = jodaDateTimeFormatter.parseLocalDateTime(text);
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
            DateTimeFormatter jodaDateTimeFormatter = getJodaDateTimeFormatter();
            LocalDateTime localDateTime = (LocalDateTime) value;
            return jodaDateTimeFormatter.print(localDateTime.toDate().getTime());
        }
    }

    private DateTimeFormatter getJodaDateTimeFormatter() {
        return DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss");
    }
}
