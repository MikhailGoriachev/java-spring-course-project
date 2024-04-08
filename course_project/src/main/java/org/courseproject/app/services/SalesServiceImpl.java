package org.courseproject.app.services;

import org.courseproject.app.entries.Sale;
import org.courseproject.app.repositories.SalesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


// Сервис для продаж
@Service
public class SalesServiceImpl implements SalesService {

    // репозиторий
    private SalesRepository repository;

    @Autowired
    public void setRepository(SalesRepository repository) {
        this.repository = repository;
    }

    // сервис
    @Autowired
    private SalesService service;

    // все записи
    @Override
    public List<Sale> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public Sale findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(Sale item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(Sale item) {
        repository.saveAndFlush(item);
    }

    // удалить запись
    @Override
    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    // часы заданного типа, цена на которые в заданном диапазоне значений
    @Override
    public List<Sale> findAllByWatchWatchTypeNameAndPriceBetween(String watchTypeName, int minPrice, int maxPrice) {
        return repository.findAllByWatchWatchTypeNameAndPriceBetween(watchTypeName, minPrice, maxPrice);
    }

    // продажи за указанный период
    @Override
    public List<Sale> findAllByDateBetween(Date minDate, Date maxDate) {
        return repository.findAllByDateBetween(minDate, maxDate);
    }
}
