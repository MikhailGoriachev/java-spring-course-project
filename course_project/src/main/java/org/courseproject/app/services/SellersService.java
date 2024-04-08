package org.courseproject.app.services;

import org.courseproject.app.entries.Seller;

import java.util.List;


// Сервис для продавцов
public interface SellersService {
    
    // все записи
    List<Seller> findAll();
    
    // запись по id
    Seller findById(Long id);
    
    // добавить запись
    void store(Seller item);
    
    // изменить запись
    void update(Seller item);
}
