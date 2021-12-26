package ua.lviv.iot.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Objects;

@Setter
@Getter
@NoArgsConstructor
@Entity
@ToString
@Table(name="client")
public class Client{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Basic
    @Column(name = "first_name")
    @NotNull(message = "Missing firstName")
    @Size(min=2, max=50)
    private String firstName;

    @Basic
    @Column(name = "last_name")
    @NotNull(message = "Missing lastName")
    @Size(min=2, max=50)
    private String lastName;

    @Basic
    @Column(name = "phone_number")
    @NotNull(message = "Missing phoneNumber")
    @Size(min=3, max=50)
    private String phoneNumber;

    public Client(final String firstName, final String lastName, final String phoneNumber) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
    }
}
