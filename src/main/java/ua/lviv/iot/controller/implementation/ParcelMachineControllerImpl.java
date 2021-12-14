package ua.lviv.iot.controller.implementation;

import ua.lviv.iot.controller.AbstractControllerImpl;
import ua.lviv.iot.model.dao.implementation.ParcelMachineDAOImpl;
import ua.lviv.iot.model.entity.ParcelMachine;

public class ParcelMachineControllerImpl extends AbstractControllerImpl<ParcelMachine> {
    public ParcelMachineControllerImpl(){
        super(new ParcelMachineDAOImpl());
    }
}
