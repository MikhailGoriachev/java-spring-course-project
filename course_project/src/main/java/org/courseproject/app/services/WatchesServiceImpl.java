package org.courseproject.app.services;

import org.courseproject.app.entries.Watch;
import org.courseproject.app.repositories.WatchesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


// Сервис для часов
@Service
public class WatchesServiceImpl implements WatchesService {
    
    // репозиторий
    private WatchesRepository repository;
    
    @Autowired
    public void setRepository(WatchesRepository repository) {
        this.repository = repository;
    }
    
    // сервис
    @Autowired
    private WatchesService service;
    
    // все записи
    @Override
    public List<Watch> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public Watch findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(Watch item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(Watch item) {
        repository.saveAndFlush(item);
    }

    // часы заданного типа
    public List<Watch> findAllByWatchTypeName(String watchTypeName){
        return repository.findAllByWatchTypeName(watchTypeName);
    }

    // часы произведенных в заданной стране
    @Override
    public List<Watch> findAllByManufactureCountryName(String manufactureCountryName){
        return repository.findAllByManufactureCountryName(manufactureCountryName);
    }
}
