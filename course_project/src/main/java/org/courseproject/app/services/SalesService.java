package org.courseproject.app.services;

import org.courseproject.app.entries.Sale;

import java.util.Date;
import java.util.List;


// Сервис для продаж
public interface SalesService {
    
    // все записи
    List<Sale> findAll();
    
    // запись по id
    Sale findById(Long id);
    
    // добавить запись
    void store(Sale item);
    
    // изменить запись
    void update(Sale item);
    
    // удалить запись
    void deleteById(Long id);

    // часы заданного типа, цена на которые в заданном диапазоне значений
    List<Sale> findAllByWatchWatchTypeNameAndPriceBetween(String watchTypeName, int minPrice, int maxPrice);

    // продажи за указанный период
    List<Sale> findAllByDateBetween(Date minDate, Date maxDate);
}
