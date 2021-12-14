package ua.lviv.iot.model.dao.implementation;

import ua.lviv.iot.model.dao.AbstractDAOImpl;
import ua.lviv.iot.model.entity.DeliveryAddress;

public class DeliveryAddressDAOImpl extends AbstractDAOImpl<DeliveryAddress> {
    public DeliveryAddressDAOImpl(){
        super(DeliveryAddress.class);
    }
}
