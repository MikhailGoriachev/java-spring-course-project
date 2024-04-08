package org.courseproject.app.services;

import org.courseproject.app.entries.WatchType;
import org.courseproject.app.repositories.WatchTypesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


// Сервис для типов часов
@Service
public class WatchTypesServiceImpl implements WatchTypesService {
    
    // репозиторий
    private WatchTypesRepository repository;
    
    @Autowired
    public void setRepository(WatchTypesRepository repository) {
        this.repository = repository;
    }
    
    // сервис
    @Autowired
    private WatchTypesService service;
    
    // все записи
    @Override
    public List<WatchType> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public WatchType findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(WatchType item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(WatchType item) {
        repository.saveAndFlush(item);
    }
}
