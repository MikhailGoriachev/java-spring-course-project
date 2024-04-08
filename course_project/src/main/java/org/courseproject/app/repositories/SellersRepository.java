package org.courseproject.app.repositories;

import org.courseproject.app.entries.Seller;
import org.springframework.data.jpa.repository.JpaRepository;


// Репозиторий продавцов
public interface SellersRepository extends JpaRepository<Seller, Long> {

}
