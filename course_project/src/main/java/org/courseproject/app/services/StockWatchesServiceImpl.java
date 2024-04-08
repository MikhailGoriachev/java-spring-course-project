package org.courseproject.app.services;

import org.courseproject.app.entries.StockWatch;
import org.courseproject.app.repositories.StockWatchesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


// Сервис для часов на складе
@Service
public class StockWatchesServiceImpl implements StockWatchesService {

    // репозиторий
    private StockWatchesRepository repository;

    @Autowired
    public void setRepository(StockWatchesRepository repository) {
        this.repository = repository;
    }

    // сервис
    @Autowired
    private StockWatchesService service;

    // все записи
    @Override
    public List<StockWatch> findAll() {
        return repository.findAll();
    }

    // запись по Id
    @Override
    public StockWatch findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    // получить состояние склада по указанной дате
    @Override
    public List<StockWatch> getAllByDate(String date) {
        return repository.getAllByDate(date);
    }

    // получить состояние склада по указанной дате и id часов
    @Override
    public StockWatch getByDateAndId(String date, long id) {
        return repository
                .getByDateAndId(date, id)
                .stream()
                .findFirst()
                .orElse(null);
    }


    // получить состояние склада по указанной дате и id часов
    // исключая из продаж текущую запись продажи (необходимо для валидации при редактировании)
    public StockWatch getByDateAndIdWithoutSaleId(String date, long watchId, long saleId) {
        return repository
                .getByDateAndIdWithoutSaleId(date, watchId, saleId)
                .stream()
                .findFirst()
                .orElse(null);
    }
}
