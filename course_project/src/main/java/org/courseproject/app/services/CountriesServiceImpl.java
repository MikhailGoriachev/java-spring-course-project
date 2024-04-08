package org.courseproject.app.services;

import org.courseproject.app.entries.Country;
import org.courseproject.app.repositories.CountriesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


// Сервис для стран
@Service
public class CountriesServiceImpl implements CountriesService {
    
    // репозиторий
    private CountriesRepository repository;
    
    @Autowired
    public void setRepository(CountriesRepository repository) {
        this.repository = repository;
    }
    
    // сервис
    @Autowired
    private CountriesService service;
    
    // все записи
    @Override
    public List<Country> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public Country findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(Country item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(Country item) {
        repository.saveAndFlush(item);
    }
}
