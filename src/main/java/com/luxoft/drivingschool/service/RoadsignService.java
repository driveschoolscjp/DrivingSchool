package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Roadsign;
import com.luxoft.drivingschool.repository.RoadsignRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

@Service
@Transactional(readOnly = true)
public class RoadsignService {

    @Autowired
    RoadsignRepository roadsignRepository;

    public List<Roadsign> findRandomRoadsigns(){

        long totalSigns = roadsignRepository.count();

        Set<Long> setId = new TreeSet<>();
        while (setId.size() < 12){
            setId.add((long) (Math.random() * totalSigns));
        }

        List<Roadsign> roadsigns = roadsignRepository.findByIdIn(setId);
        Collections.shuffle(roadsigns);
        return roadsigns;
    }
}
