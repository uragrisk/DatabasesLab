package ua.lviv.iot.controller.implementation;


import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.PackageDAOImpl;
import ua.lviv.iot.model.entity.Package;

public class PackageControllerImpl extends AbstractControllerImpl<Package> {
    public PackageControllerImpl(){
        super(new PackageDAOImpl());
    }
}
