package org.courseproject.app.repositories;

import org.courseproject.app.entries.Sale;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;


// Репозиторий продаж
public interface SalesRepository extends JpaRepository<Sale, Long> {

    // часы заданного типа, цена на которые в заданном диапазоне значений
    List<Sale> findAllByWatchWatchTypeNameAndPriceBetween(String watchTypeName, int minPrice, int maxPrice);
    
    // продажи за указанный период
    List<Sale> findAllByDateBetween(Date minDate, Date maxDate);
}
