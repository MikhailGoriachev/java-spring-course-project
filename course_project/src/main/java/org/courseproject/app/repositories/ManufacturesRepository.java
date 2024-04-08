package org.courseproject.app.repositories;

import org.courseproject.app.entries.Manufacture;
import org.springframework.data.jpa.repository.JpaRepository;


// Репозиторий производителей
public interface ManufacturesRepository extends JpaRepository<Manufacture, Long> {

}
