package ua.lviv.iot.dto;

import ua.lviv.iot.models.Client;

public class ClientDto {
    private Client client;

    public ClientDto(Client client) {
        this.client = client;
    }

    public Integer getId() {
        return client.getId();
    }

    public String getFirstName() {
        return client.getFirstName();
    }

    public String getLastName() {
        return client.getLastName();
    }


    public String getPhoneNumber() {
        return client.getPhoneNumber();
    }
}
