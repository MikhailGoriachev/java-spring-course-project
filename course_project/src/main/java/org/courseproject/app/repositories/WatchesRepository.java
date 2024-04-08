package org.courseproject.app.repositories;

import org.courseproject.app.entries.Watch;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


// Репозиторий часов
public interface WatchesRepository extends JpaRepository<Watch, Long> {

    // часы заданного типа
    List<Watch> findAllByWatchTypeName(String watchTypeName);
    
    // часы произведенных в заданной стране
    List<Watch> findAllByManufactureCountryName(String manufactureCountryName);
}
