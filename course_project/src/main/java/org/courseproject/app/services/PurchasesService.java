package org.courseproject.app.services;

import org.courseproject.app.entries.Purchase;

import java.util.Date;
import java.util.List;


// Сервис для закупок
public interface PurchasesService {
    
    // все записи
    List<Purchase> findAll();
    
    // запись по id
    Purchase findById(Long id);
    
    // добавить запись
    void store(Purchase item);
    
    // изменить запись
    void update(Purchase item);

    // закупки за указанный период
    List<Purchase> findAllByDateBetween(Date minDate, Date maxDate);
}
