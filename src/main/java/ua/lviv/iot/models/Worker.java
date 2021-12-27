package ua.lviv.iot.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Date;
import java.util.Objects;

@Setter
@Getter
@NoArgsConstructor
@Entity
@ToString
@Table(name="worker")
public class Worker{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Basic
    @Column(name = "first_name")
    @NotNull(message = "Missing firstName")
    @Size(min=2, max=32)
    private String firstName;

    @Basic
    @Column(name = "last_name")
    @NotNull(message = "Missing lastName")
    @Size(min=2, max=32)
    private String lastName;

    @Basic
    @Column(name = "patronymic")
    @NotNull(message = "Missing patronymic")
    @Size(min=2, max=32)
    private String patronymic;

    @Basic
    @Column(name = "position")
    @NotNull(message = "Missing position")
    @Size(min=2, max=32)
    private String position;

    @Basic
    @Column(name = "salary")
    @NotNull(message = "Missing salary")
    @Min(1)
    @Max(999999)
    private Double salary;

    @Basic
    @Column(name = "passport_number")
    @NotNull(message = "Missing passportNumber")
    @Min(1)
    @Max(999999)
    private Integer passportNumber;

    @Basic
    @Column(name = "hirring_date")
    @NotNull(message = "Missing hirringDate")
    private Date hirringDate;

    @Basic
    @Column(name = "working_hours")
    @NotNull(message = "Missing workingHours")
    @Min(1)
    @Max(999999)
    private Integer workingHours;

    @ManyToOne
    @JoinColumn(name = "post_office_id", referencedColumnName = "id", nullable = false)
    @NotNull(message = "Missing postOfficeByPostOfficeId")
    private PostOffice postOfficeByPostOfficeId;

    public Worker(final String firstName, final String lastName, final String patronymic,
                  final String position, final Double salary, final Integer passportNumber, final Date hirringDate,
                  final Integer workingHours, final PostOffice postOfficeByPostOfficeId) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.patronymic = patronymic;
        this.position = position;
        this.salary = salary;
        this.passportNumber = passportNumber;
        this.hirringDate = hirringDate;
        this.workingHours = workingHours;
        this.postOfficeByPostOfficeId = postOfficeByPostOfficeId;
    }
}
