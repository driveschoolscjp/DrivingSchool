package com.luxoft.drivingschool.model.tests;


import com.luxoft.drivingschool.model.enums.Transmission;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;

@Entity
@Table(name = "themes")
public class Theme extends AbstractPersistable<Long> {
    @Column(length = 50)
    private String name;
}
