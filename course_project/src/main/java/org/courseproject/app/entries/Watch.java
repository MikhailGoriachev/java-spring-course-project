package org.courseproject.app.entries;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


// Часы
@Entity
@Table(name = "watches")
@Getter
@Setter
@NoArgsConstructor
public class Watch {

    // id
    @Id
    private Long id;
    
    // марка (название часов)
    @Column
    private String name;
    
    // производитель
    @ManyToOne
    private Manufacture manufacture;
    
    // тип часов
    @ManyToOne
    @JoinColumn(name = "watch_type_id")
    private WatchType watchType;

    
    // закупки
    @OneToMany
    @Transient
    private List<Purchase> purchases;

    // продажи
    @OneToMany
    @Transient
    private List<Sale> sales;


    public Watch(Long id, String name, Manufacture manufacture, WatchType watchType) {
        this.id = id;
        this.name = name;
        this.manufacture = manufacture;
        this.watchType = watchType;
    }

    // получить строковое представление
    public String getInfoString() {
        return String.format("%s | %s", name, manufacture.getName());
    }
}
