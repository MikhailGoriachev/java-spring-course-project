package org.courseproject.app.repositories;

import org.courseproject.app.entries.StockWatch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


// Репозиторий часов на складе
public interface StockWatchesRepository extends JpaRepository<StockWatch, Long> {

    // получить состояние склада по указанной дате
    @Query(value = "call stock_watches_by_date(:date_in);", nativeQuery = true)
    List<StockWatch> getAllByDate(@Param("date_in") String date);

    // получить состояние склада по указанной дате и id часов
    @Query(value = "call stock_watches_by_date_and_watch_id(:date_in, :watch_id_in);", nativeQuery = true)
    List<StockWatch> getByDateAndId(@Param("date_in") String date, @Param("watch_id_in") long id);

    // получить состояние склада по указанной дате и id часов
    // исключая из продаж текущую запись продажи (необходимо для валидации при редактировании)
    @Query(value = "call stock_watches_by_date_and_watch_id_without_sale_id(:date_in, :watch_id_in, :sale_id_in);",
            nativeQuery = true)
    List<StockWatch> getByDateAndIdWithoutSaleId(@Param("date_in") String date, 
                                                 @Param("watch_id_in") long watchId, 
                                                 @Param("sale_id_in") long saleId);
}
