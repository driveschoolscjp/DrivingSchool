package com.luxoft.drivingschool.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({DataConfig.class})
public class RootConfig {

}
