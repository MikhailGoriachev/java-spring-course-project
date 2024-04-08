package org.courseproject.app.services;

import org.courseproject.app.entries.Country;

import java.util.List;


// Сервис для стран
public interface CountriesService {
    
    // все записи
    List<Country> findAll();
    
    // запись по id
    Country findById(Long id);
    
    // добавить запись
    void store(Country item);
    
    // изменить запись
    void update(Country item);
}
