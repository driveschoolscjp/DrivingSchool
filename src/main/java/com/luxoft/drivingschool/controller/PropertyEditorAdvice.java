package com.luxoft.drivingschool.controller;

import com.luxoft.drivingschool.controller.editor.LocalDateEditor;
import org.joda.time.LocalDate;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class PropertyEditorAdvice {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, new LocalDateEditor());
    }
}
