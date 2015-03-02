package com.luxoft.drivingschool.service.impl;

import com.luxoft.drivingschool.model.Person;
import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.Teacher;
import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import com.luxoft.drivingschool.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Aleksei Chumakov on 01.03.2015.
 */
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private AuthService authService;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        Person user = authService.getPerson(login);
        if (user == null) {
            throw new UsernameNotFoundException("No user with login '" + login + "' found!");
        }
        Set<GrantedAuthority> roles = new HashSet();
        if (user instanceof Teacher) {
            roles.add(new SimpleGrantedAuthority(UserRoleEnum.ADMIN.name()));
        } else if (user instanceof Student) {
            roles.add(new SimpleGrantedAuthority(UserRoleEnum.STUDENT.name()));
        }
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(
                user.getLogin(), user.getPassword(), roles);

        return userDetails;
    }

}
