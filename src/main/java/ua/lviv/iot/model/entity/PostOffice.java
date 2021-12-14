package ua.lviv.iot.model.entity;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
@Table(name = "post_office")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@EqualsAndHashCode(of = "id")
@ToString

public class PostOffice {

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

    @Column(name = "city_name", length = 50)
    @NotNull
    private String cityName;

    @Column(name = "open_time")
    @NotNull
    private LocalDateTime openTime;

    @Column(name = "close_time")
    @NotNull
    private LocalDateTime closeTime;
}
