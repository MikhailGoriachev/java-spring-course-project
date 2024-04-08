package org.courseproject.app.services;

import org.courseproject.app.entries.Purchase;
import org.courseproject.app.repositories.PurchasesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


// Сервис для закупок
@Service
public class PurchasesServiceImpl implements PurchasesService {
    
    // репозиторий
    private PurchasesRepository repository;
    
    @Autowired
    public void setRepository(PurchasesRepository repository) {
        this.repository = repository;
    }
    
    // сервис
    @Autowired
    private PurchasesService service;
    
    // все записи
    @Override
    public List<Purchase> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public Purchase findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(Purchase item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(Purchase item) {
        repository.saveAndFlush(item);
    }

    // закупки за указанный период
    @Override
    public List<Purchase> findAllByDateBetween(Date minDate, Date maxDate) {
        return repository.findAllByDateBetween(minDate, maxDate);
    }
}
