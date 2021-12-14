package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.CityDAOImpl;
import ua.lviv.iot.model.entity.City;

public class CityControllerImpl extends AbstractControllerImpl<City> {
    public CityControllerImpl(){
        super(new CityDAOImpl());
    }
}
