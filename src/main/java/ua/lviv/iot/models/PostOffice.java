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
@Table(name = "post_office")
public class PostOffice{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Basic
    @Column(name = "name")
    @NotNull(message = "Missing name")
    @Size(min=2, max=32)
    private String name;

    @Basic
    @Column(name = "city")
    @NotNull(message = "Missing city")
    @Size(min=2, max=32)
    private String city;

    @Basic
    @Column(name = "address")
    @NotNull(message = "Missing address")
    @Size(min=2, max=32)
    private String address;

    public PostOffice(final String name, final String city, final String address) {
        this.name = name;
        this.city = city;
        this.address = address;
    }
}
