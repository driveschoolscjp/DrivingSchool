package com.luxoft.DrivingSchool.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(ConfigDAO.class)
public class RootConfig {

}
