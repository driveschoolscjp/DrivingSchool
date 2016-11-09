package com.luxoft.drivingschool.model;

import com.luxoft.drivingschool.model.enums.Transmission;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "cars")
public class Car extends AbstractPersistable<Long> {

    @NotNull
    @Size(max = 50)
    private String brand;
    @NotNull
    @Size(max = 50)
    private String model;
    @NotNull
    @Enumerated(EnumType.STRING)
    private Transmission transmission;
    @NotNull
    private int horsePower;
    private float pricePerHour;
    @NotNull
    @OneToOne
    private Teacher instructor;
    private String photoURL;

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

    public int getHorsePower() {
        return horsePower;
    }

    public void setHorsePower(int horsePower) {
        this.horsePower = horsePower;
    }

    public float getPricePerHour() {
        return pricePerHour;
    }

    public void setPricePerHour(float pricePerHour) {
        this.pricePerHour = pricePerHour;
    }

    public Teacher getInstructor() {
        return instructor;
    }

    public void setInstructor(Teacher instructor) {
        this.instructor = instructor;
    }

    public String getPhotoURL() {
        return photoURL;
    }

    public void setPhotoURL(String photoURL) {
        this.photoURL = photoURL;
    }

    @Override
    public void setId(Long id) {
        super.setId(id);
    }
}
