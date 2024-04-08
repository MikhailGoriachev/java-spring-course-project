package org.courseproject.app.services;

import org.courseproject.app.entries.WatchType;

import java.util.List;


// Сервис для типов часов
public interface WatchTypesService {
    
    // все записи
    List<WatchType> findAll();
    
    // запись по id
    WatchType findById(Long id);
    
    // добавить запись
    void store(WatchType item);
    
    // изменить запись
    void update(WatchType item);
}
