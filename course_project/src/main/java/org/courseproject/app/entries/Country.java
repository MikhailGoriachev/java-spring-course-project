package org.courseproject.app.entries;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


// Страна
@Entity
@Table(name = "countries")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Country {

    // id
    @Id
    private Long id;
    
    // название
    @Column(name = "name", length = 50)
    private String name;

    
    // производители
    @OneToMany
    @Transient
    private List<Manufacture> manufactures;
}
