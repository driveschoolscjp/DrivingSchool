package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Student;
import com.luxoft.drivingschool.model.enums.UserRoleEnum;
import com.luxoft.drivingschool.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserDetailsServiceImpl implements UserDetailsService {

    private static final String ADMIN_LOGIN = "a";
    private static final String ADMIN_PASSWORD = "a";

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {

        List<GrantedAuthority> roles = new ArrayList<>();

        if (login.equals(ADMIN_LOGIN)) {
            roles.add(new SimpleGrantedAuthority(UserRoleEnum.ROLE_ADMIN.name()));
            return new User(ADMIN_LOGIN, ADMIN_PASSWORD, roles);
        }
        Student user = studentRepository.findByLogin(login);
        if (user != null) {
            roles.add(new SimpleGrantedAuthority(UserRoleEnum.ROLE_STUDENT.name()));
            return new User(user.getLogin(), user.getPassword(), roles);
        }
        throw new UsernameNotFoundException("User " + login + " not found.");
    }

}
