package org.courseproject.app.repositories;

import org.courseproject.app.entries.Purchase;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;


// Репозиторий закупок
public interface PurchasesRepository extends JpaRepository<Purchase, Long> {

    // закупки за указанный период
    List<Purchase> findAllByDateBetween(Date minDate, Date maxDate);
}
