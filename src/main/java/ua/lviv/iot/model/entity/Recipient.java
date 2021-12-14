package ua.lviv.iot.model.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "recipient")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
@ToString

public class Recipient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name", length = 45)
    private String name;

    @Column(name = "surname", length = 30)
    private String surname;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "passport_seria")
    private String passportSeria;

    @Column(name = "street", length = 50)
    private String street;

    @Column(name = "zip")
    @NotNull
    private String zip;

    @Column(name = "city_name", length = 50)
    @NotNull
    private String cityName;
}
