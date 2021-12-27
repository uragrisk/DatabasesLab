package ua.lviv.iot.dto;

import ua.lviv.iot.models.Delivery;
import ua.lviv.iot.models.Type;
import ua.lviv.iot.models.Worker;

public class DeliveryDto {
    private Delivery delivery;

    public DeliveryDto(Delivery delivery) {
        this.delivery = delivery;
    }

    public Integer getId() {
        return delivery.getId();
    }

    public Worker getWorkerId() {
        return delivery.getWorkerId();
    }

    public Double getPrice() {
        return delivery.getPrice();
    }

    public Type getType() {
        return delivery.getType();
    }

    public Double getMaxWeight() {
        return delivery.getMaxWeight();
    }

    public Double getMinWeight() {
        return delivery.getMinWeight();
    }
}
