package ua.lviv.iot.model.entity;

import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "region")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
@ToString

public class Region {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "name", length = 50)
    @NotNull
    private String name;

}
