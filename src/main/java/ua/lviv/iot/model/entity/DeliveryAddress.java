package ua.lviv.iot.model.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "delivery_address")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
@ToString

public class DeliveryAddress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "street", length = 45)
    private String name;

    @Column(name = "city_name", length = 50)
    @NotNull
    private String surname;

    @Column(name = "delivery_to_department", length = 45)
    private String deliveryToDepartment;

}
