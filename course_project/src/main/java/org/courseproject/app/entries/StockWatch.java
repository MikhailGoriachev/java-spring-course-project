package org.courseproject.app.entries;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;


// Часы на складе
@Entity
@Table(name = "view_stock_watches")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StockWatch {

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

    // количество
    @Column(name = "amount")
    private int amount;

    
    // получить строковое представление
    public String getInfoString() {
        return String.format("%s | %s | В наличии: %d шт.", name, manufacture.getName(), amount);
    }
}
