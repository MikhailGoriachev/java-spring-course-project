package org.courseproject.app.repositories;

import org.courseproject.app.entries.WatchType;
import org.springframework.data.jpa.repository.JpaRepository;


// Репозиторий типов часов
public interface WatchTypesRepository extends JpaRepository<WatchType, Long> {
    
}
