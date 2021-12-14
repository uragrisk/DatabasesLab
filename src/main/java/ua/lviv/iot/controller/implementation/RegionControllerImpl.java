package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.RegionDAOImpl;
import ua.lviv.iot.model.entity.Region;

public class RegionControllerImpl extends AbstractControllerImpl<Region> {
    public RegionControllerImpl(){
        super(new RegionDAOImpl());
    }
}
