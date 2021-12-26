package ua.lviv.iot.dto;

import ua.lviv.iot.models.PostOffice;
import ua.lviv.iot.models.Worker;

import java.sql.Date;

public class WorkerDto {
    private Worker worker;

    public WorkerDto(Worker worker) {
        this.worker = worker;
    }

    public Integer getId() {
        return worker.getId();
    }

    public String getFirstName() {
        return worker.getFirstName();
    }

    public String getLastName() {
        return worker.getLastName();
    }

    public String getPatronymic() {
        return worker.getPatronymic();
    }

    public String getPosition() {
        return worker.getPosition();
    }

    public Double getSalary() {
        return worker.getSalary();
    }

    public Integer getPassportNumber() {
        return worker.getPassportNumber();
    }

    public Date getHirringDate() {
        return worker.getHirringDate();
    }

    public Integer getWorkingHours() {
        return worker.getWorkingHours();
    }

    public PostOffice getPostOfficeByPostOfficeId() {
        return worker.getPostOfficeByPostOfficeId();
    }

}
