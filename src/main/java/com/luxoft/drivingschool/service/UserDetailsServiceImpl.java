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
    private final String ADMIN_LOGIN = "a";
    private final String ADMIN_PASSWORD = "a";
    @Autowired
    private StudentRepository studentRepository;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {

        if (login.equals(ADMIN_LOGIN)) {
            List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
            roles.add(new SimpleGrantedAuthority(UserRoleEnum.ADMIN.name()));
            return new User(ADMIN_LOGIN, ADMIN_PASSWORD, roles);
        }
        Student user = studentRepository.findByLogin(login);
        if (user != null) {
            List<GrantedAuthority> roles = new ArrayList();
            roles.add(new SimpleGrantedAuthority(UserRoleEnum.STUDENT.name()));
            return new User(user.getLogin(), user.getPassword(), roles);
        }
        throw new UsernameNotFoundException("Wrong login");
    }

}
