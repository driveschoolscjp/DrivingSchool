package com.luxoft.drivingschool.service.testing;


import com.luxoft.drivingschool.model.testing.Theme;
import com.luxoft.drivingschool.repository.testing.ThemeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class ThemeService {
    @Autowired
    ThemeRepository themeRepository;

    public List<Theme> findAll(){
        return themeRepository.findAll();
    }

    @Transactional
    public Theme save(Theme theme){
        return themeRepository.save(theme);
    }

    public Theme findOne(long id){
        return themeRepository.findOne(id);
    }
}
