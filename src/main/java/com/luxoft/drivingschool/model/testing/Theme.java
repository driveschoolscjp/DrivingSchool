package com.luxoft.drivingschool.model.testing;


import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;

@Entity
@Table(name = "themes")
public class Theme extends AbstractPersistable<Long> {
    @Column(length = 50)
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
