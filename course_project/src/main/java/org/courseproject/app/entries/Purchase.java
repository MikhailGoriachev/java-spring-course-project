package org.courseproject.app.entries;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


import javax.persistence.*;

import java.util.Date;

// Закупка
@Entity
@Table(name = "purchases")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Purchase {

    @Id
    private Long id;

    // дата закупки
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;

    // часы
    @ManyToOne
    private Watch watch;

    // цена
    @Column(name = "price")
    private int price;

    // количество
    @Column(name = "amount")
    private int amount;
}
