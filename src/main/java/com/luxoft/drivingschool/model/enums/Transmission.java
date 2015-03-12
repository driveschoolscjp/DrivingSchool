package com.luxoft.drivingschool.model.enums;

public enum Transmission {
    MANUAL("Ручная"), AUTO("Авто");

    private final String value;

    Transmission(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
