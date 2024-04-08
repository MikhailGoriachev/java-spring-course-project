package org.courseproject.app.entries;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;


// Продажа
@Entity
@Table(name = "sales")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Sale {

    // id
    @Id
    private Long id;
    
    // дата закупки
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    
    // часы
    @ManyToOne
    private Watch watch;
    
    // продавец
    @ManyToOne
    private Seller seller;
    
    // цена
    @Column(name = "price")
    private int price;
    
    // количество
    @Column(name = "amount")
    private int amount;
}
