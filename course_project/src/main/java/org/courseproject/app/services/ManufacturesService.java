package org.courseproject.app.services;

import org.courseproject.app.entries.Manufacture;

import java.util.List;


// Сервис для производителей
public interface ManufacturesService {
    
    // все записи
    List<Manufacture> findAll();
    
    // запись по id
    Manufacture findById(Long id);
    
    // добавить запись
    void store(Manufacture item);
    
    // изменить запись
    void update(Manufacture item);
}
