package com.luxoft.drivingschool.model.enums;

public enum Gender {
    MALE("Мужской"), FEMALE("Женский");

    private final String value;

    Gender(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
