package ua.lviv.iot.model.entity;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "city")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "name")
@ToString

public class City {



    @Id
    @Column(name = "name", length = 45)
    private String name;

    @Column(name = "region_id")
    @NotNull
    private Integer regionId;


}
