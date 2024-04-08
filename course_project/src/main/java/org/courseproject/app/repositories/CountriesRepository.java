package org.courseproject.app.repositories;

import org.courseproject.app.entries.Country;
import org.springframework.data.jpa.repository.JpaRepository;


// Репозиторий стран
public interface CountriesRepository extends JpaRepository<Country, Long> {
    
}
