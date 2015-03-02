package com.luxoft.drivingschool.configuration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

/**
 * Created by Aleksei Chumakov on 01.03.2015.
 */
public class MyWebAppInitializer implements WebApplicationInitializer {
    private static final String DISPATCHER_SERVLET_NAME = "dispatcher";

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(WebAppConfig.class);
        rootContext.register(SecurityConfig.class);
        servletContext.addListener(new ContextLoaderListener(rootContext));
        rootContext.setServletContext(servletContext);
        ServletRegistration.Dynamic servlet = servletContext.addServlet(DISPATCHER_SERVLET_NAME, new DispatcherServlet(rootContext));
        servlet.addMapping("/");
        servlet.setLoadOnStartup(1);
    }

}