package ua.lviv.iot.model.entity;

import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "parcel_machine")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
@ToString

public class ParcelMachine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "street", length = 45)
    @NotNull
    private String street;

    @Column(name = "number")
    @NotNull
    private Integer number;

    @Column(name = "city_name")
    private String cityName;

}
