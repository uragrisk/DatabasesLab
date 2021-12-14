package ua.lviv.iot.model.dao.implementation;

import ua.lviv.iot.model.dao.AbstractDAOImpl;
import ua.lviv.iot.model.entity.Sender;


public class SenderDAOImpl extends AbstractDAOImpl<Sender> {
    public SenderDAOImpl(){
        super(Sender.class);
    }
}
