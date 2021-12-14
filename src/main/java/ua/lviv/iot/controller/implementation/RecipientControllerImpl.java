package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.RecipientDAOImpl;
import ua.lviv.iot.model.entity.Recipient;

public class RecipientControllerImpl extends AbstractControllerImpl<Recipient> {
    public RecipientControllerImpl(){
        super(new RecipientDAOImpl());
    }
}
