package ua.lviv.iot.model.entity;

import lombok.*;
import javax.persistence.*;


import javax.validation.constraints.NotNull;

@Entity
@Table(name = "package")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
@ToString

public class Package {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "weigh")
    @NotNull
    private Float weigh;

    @Column(name = "description", length = 50)
    private String description;

    @Column(name = "post_office_id")
    private Integer post_officeId;

    @Column(name = "recipient_id")
    @NotNull
    private Integer recipientId;

    @Column(name = "sender_id")
    @NotNull
    private Integer senderId;

    @Column(name = "parcel_machine_id")
    private Integer parcelMachineId;

    @Column(name = "delivery_address_id")
    @NotNull
    private Integer deliveryAddressId ;

}
