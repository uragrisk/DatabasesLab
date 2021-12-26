package ua.lviv.iot.dto;

import ua.lviv.iot.models.Package;

import java.sql.Date;

public class PackageDto {

    private Package Package;

    public PackageDto(Package Package) {
        this.Package = Package;
    }

    public Integer getId() {
        return Package.getId();
    }

    public Double getPrice() {
        return Package.getPrice();
    }

    public Double getWeight() {
        return Package.getWeight();
    }

    public Date getDateSend() {
        return Package.getDateSend();
    }

    public Date getDateRecive() {
        return Package.getDateRecive();
    }

    public String getAddressSender() {
        return Package.getAddressSender();
    }

    public String getAddressReciver() {
        return Package.getAddressReciver();
    }
}
