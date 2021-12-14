package ua.lviv.iot.model.dao.implementation;


import ua.lviv.iot.model.dao.AbstractDAOImpl;
import ua.lviv.iot.model.entity.Package;

public class PackageDAOImpl extends AbstractDAOImpl<Package> {
    public PackageDAOImpl(){
        super(Package.class);
    }
}
