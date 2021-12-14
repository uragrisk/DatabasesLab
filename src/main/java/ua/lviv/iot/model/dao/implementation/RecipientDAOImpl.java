package ua.lviv.iot.model.dao.implementation;

import ua.lviv.iot.model.dao.AbstractDAOImpl;
import ua.lviv.iot.model.entity.Recipient;

public class RecipientDAOImpl extends AbstractDAOImpl<Recipient> {
    public RecipientDAOImpl(){
        super(Recipient.class);
    }
}
