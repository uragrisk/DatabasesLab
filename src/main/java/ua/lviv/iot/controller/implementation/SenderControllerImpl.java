package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.SenderDAOImpl;
import ua.lviv.iot.model.entity.Sender;

public class SenderControllerImpl extends AbstractControllerImpl<Sender> {
    public SenderControllerImpl(){
        super(new SenderDAOImpl());
    }
}
