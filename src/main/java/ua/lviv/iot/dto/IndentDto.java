package ua.lviv.iot.dto;


import ua.lviv.iot.models.*;
import ua.lviv.iot.models.Package;

public class IndentDto {

    private Indent indent;

    public IndentDto(Indent indent) {
        this.indent = indent;
    }

    public Integer getId() {
        return indent.getId();
    }

    public PostOffice getPostOfficeFromId() {
        return indent.getPostOfficeFromId();
    }

    public PostOffice getPostOfficeToId() {
        return indent.getPostOfficeToId();
    }

    public Client getClientBySenderId() {
        return indent.getClientBySenderId();
    }

    public Client getClientByReciverId() {
        return indent.getClientByReciverId();
    }

    public Package getParcelId() {
        return indent.getPackageId();
    }

    public Delivery getDeliveryByDeliveryId() {
        return indent.getDeliveryByDeliveryId();
    }

    public String getStatus() {
        return indent.getStatus();
    }
}
