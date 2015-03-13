package com.luxoft.drivingschool.service;

import com.luxoft.drivingschool.model.Roadsign;
import com.luxoft.drivingschool.repository.RoadsignRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class RoadsignService {

    @Autowired
    RoadsignRepository roadsignRepository;

    public List<Roadsign> findTwelveRandomRoadsigns(){

        roadsignRepository.findAll();

        return null;
    }
}
