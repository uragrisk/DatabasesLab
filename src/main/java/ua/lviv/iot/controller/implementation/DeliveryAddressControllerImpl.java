package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.DeliveryAddressDAOImpl;
import ua.lviv.iot.model.entity.DeliveryAddress;

public class DeliveryAddressControllerImpl extends AbstractControllerImpl<DeliveryAddress> {
    public DeliveryAddressControllerImpl(){
        super(new DeliveryAddressDAOImpl());
    }
}
