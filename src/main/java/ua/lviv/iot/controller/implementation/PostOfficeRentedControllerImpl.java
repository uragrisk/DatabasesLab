package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.PostOfficeDAOImpl;
import ua.lviv.iot.model.entity.PostOffice;

public class PostOfficeRentedControllerImpl extends AbstractControllerImpl<PostOffice> {
    public PostOfficeRentedControllerImpl(){
        super(new PostOfficeDAOImpl());
    }
}
