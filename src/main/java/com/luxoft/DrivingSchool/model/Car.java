package com.luxoft.DrivingSchool.model;

import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;

@Entity
@Table(name = "cars")
public class Car extends AbstractPersistable<Long> {
    @Column(length = 40)
    private String brand;
    @Column(length = 40)
    private String model;
    @Enumerated(EnumType.ORDINAL)
    private Transmission transmission;
    private float engineSize;
    private float pricePerHour;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "instructor_id")
    private Teacher teacher;

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Transmission getTransmission() {
        return transmission;
    }

    public void setTransmission(Transmission transmission) {
        this.transmission = transmission;
    }

    public float getEngineSize() {
        return engineSize;
    }

    public void setEngineSize(float engineSize) {
        this.engineSize = engineSize;
    }

    public float getPricePerHour() {
        return pricePerHour;
    }

    public void setPricePerHour(float pricePerHour) {
        this.pricePerHour = pricePerHour;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
