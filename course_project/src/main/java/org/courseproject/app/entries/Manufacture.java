package org.courseproject.app.entries;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


// Производитель
@Entity
@Table(name = "manufactures")
@Getter
@Setter
@NoArgsConstructor
public class Manufacture {

    // id
    @Id
    private Long id;

    // наименование
    @Column(name = "name", length = 50)
    private String name;

    // страна
    @ManyToOne
    private Country country;
    

    // часы
    @OneToMany
    @Transient
    private List<Watch> watches;


    public Manufacture(Long id, String name, Country country) {
        this.id = id;
        this.name = name;
        this.country = country;
    }

    // получить строковое представление
    public String getInfoString() {
        return String.format("%s | %s", name, country.getName());
    }
}
