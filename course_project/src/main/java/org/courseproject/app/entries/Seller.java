package org.courseproject.app.entries;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;


// Продавец
@Entity
@Table(name = "sellers")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Seller {

    // id
    @Id
    private Long id;
    
    // фамилия
    @Column(name = "surname", length = 60)
    private String surname;
    
    // имя
    @Column(name = "name", length = 60)
    private String name;
    
    // отчество (необязательно для заполнения)
    @Column(name = "patronymic", length = 60, nullable = true)
    private String patronymic;
    
    // процент отчислений
    @Column(name = "interest")
    private double interest;


    // продажи
    @OneToMany
    @Transient
    private List<Sale> sales;
    
    // получить строковое представление
    public String getInfoString() {
        return String.format("%s %s. %s.", surname, name.charAt(0), patronymic.charAt(0));
    }
}
