package com.luxoft.drivingschool.configuration;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class SecurityWebInitializer extends AbstractSecurityWebApplicationInitializer {
    // Abstract superclass oh this class automatically register DelegatingFilterProxy
    // that will allow using Spring Security

    // AbstractSecurityWebApplicationInitializer implements WebApplicationInitializer
    // (AbstractAnnotationConfigDispatcherServletInitializer also do that)
    // so onStartup method will be called automatically? and it will register DelegatingFilterProxy
    // A filter that delegates all requests to a filter in Spring repository?
    // that will do all stuff with securing application
}
