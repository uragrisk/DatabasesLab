package ua.lviv.iot.model.dao.implementation;

import ua.lviv.iot.model.dao.AbstractDAOImpl;
import ua.lviv.iot.model.entity.City;

public class CityDAOImpl extends AbstractDAOImpl<City> {
    public CityDAOImpl(){
        super(City.class);
    }
}
