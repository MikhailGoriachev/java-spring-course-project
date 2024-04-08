package org.courseproject.app.services;

import org.courseproject.app.entries.Seller;
import org.courseproject.app.repositories.SellersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


// Сервис для продавцов
@Service
public class SellersServiceImpl implements SellersService {
    
    // репозиторий
    private SellersRepository repository;
    
    @Autowired
    public void setRepository(SellersRepository repository) {
        this.repository = repository;
    }
    
    // сервис
    @Autowired
    private SellersService service;
    
    // все записи
    @Override
    public List<Seller> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public Seller findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // добавить запись
    @Override
    public void store(Seller item) {
        item.setId(0L);
        repository.saveAndFlush(item);
    }

    // изменить запись
    @Override
    public void update(Seller item) {
        repository.saveAndFlush(item);
    }
}
