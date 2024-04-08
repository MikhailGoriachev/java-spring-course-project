package org.courseproject.app.services;

import org.courseproject.app.entries.Watch;

import java.util.List;


// Сервис для часов
public interface WatchesService {
    
    // все записи
    List<Watch> findAll();
    
    // запись по id
    Watch findById(Long id);
    
    // добавить запись
    void store(Watch item);
    
    // изменить запись
    void update(Watch item);

    // часы заданного типа
    List<Watch> findAllByWatchTypeName(String watchTypeName);

    // часы произведенных в заданной стране
    List<Watch> findAllByManufactureCountryName(String manufactureCountryName);
}
