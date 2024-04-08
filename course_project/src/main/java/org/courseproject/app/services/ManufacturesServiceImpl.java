package org.courseproject.app.services;

import org.courseproject.app.entries.Manufacture;
import org.courseproject.app.repositories.ManufacturesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


// Сервис для производителей
@Service
public class ManufacturesServiceImpl implements ManufacturesService {
    
    // репозиторий
    private ManufacturesRepository repository;
    
    @Autowired
    public void setRepository(ManufacturesRepository repository) {
        this.repository = repository;
    }
    
    // сервис
    @Autowired
    private ManufacturesService service;
    
    // все записи
    @Override
    public List<Manufacture> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public Manufacture findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(Manufacture item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(Manufacture item) {
        repository.saveAndFlush(item);
    }
}
