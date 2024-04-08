package org.courseproject.app.entries;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


// Тип часов
@Entity
@Table(name = "watch_types")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class WatchType {

    // id
    @Id
    private Long id;
    
    // наименование
    @Column(name = "name", length = 50)
    private String name;

    
    // часы
    @OneToMany
    @Transient
    private List<Watch> watches;

    
    // получить строковое представление
    public String getInfoString() {
        return String.format("%d. %s", id, name);
    }
}
