package org.courseproject.app.services;

import org.courseproject.app.entries.StockWatch;

import java.util.List;


// Сервис для часов на складе
public interface StockWatchesService {

    // все записи
    List<StockWatch> findAll();

    // запись по id
    StockWatch findById(Long id);

    // получить состояние склада по указанной дате
    List<StockWatch> getAllByDate(String date);

    // получить состояние склада по указанной дате и id часов
    StockWatch getByDateAndId(String date, long id);

    // получить состояние склада по указанной дате и id часов
    // исключая из продаж текущую запись продажи (необходимо для валидации при редактировании)
    StockWatch getByDateAndIdWithoutSaleId(String date, long watchId, long saleId);
}
