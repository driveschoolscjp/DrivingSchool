package com.luxoft.drivingschool.model.testing;


import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "themes")
public class Theme extends AbstractPersistable<Long> {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
