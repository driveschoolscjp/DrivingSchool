package com.luxoft.drivingschool.configuration;

import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    
    @Autowired
    private UserDetailsService userDetailsService;

    // Устанавливаем ограничения на URL
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
            .authorizeRequests()
                .antMatchers("/admin/**").hasAuthority(UserRoleEnum.ROLE_ADMIN.name())
                .antMatchers("/student/**").hasAuthority(UserRoleEnum.ROLE_STUDENT.name())
                .antMatchers("/scheduler/**").authenticated()
                .antMatchers("/schedule/**").authenticated()
                .anyRequest().permitAll()
                .and()
            .formLogin()
            .loginPage("/")
                .loginProcessingUrl("/login")
            .failureUrl("/")
                .and()
            .logout()
            .logoutSuccessUrl("/")

            .and().csrf().disable(); // temporarily
    }

    // Устанавливаем, где брать пользователей
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
    }
}
