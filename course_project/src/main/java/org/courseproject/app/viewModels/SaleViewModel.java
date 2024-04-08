package org.courseproject.app.viewModels;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.courseproject.app.entries.Sale;
import org.courseproject.app.middleware.Services;
import org.courseproject.app.utils.Utils;

// Модель представления для Продажи
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SaleViewModel {

    private Long id;

    // дата продажи
    private String date;

    // часы
    private Long watchId;

    // продавец
    private Long sellerId;

    // цена
    private int price;

    // количество
    private int amount;


    // создать модель представления из модели
    public static SaleViewModel fromModel(Sale item) {
        return new SaleViewModel(
                item.getId(),
                Utils.dateHtmlToFormat(item.getDate()),
                item.getWatch().getId(),
                item.getSeller().getId(),
                item.getPrice(),
                item.getAmount()
        );
    }
    
    // создать модель из модели представления
    public Sale toModel(Services services) {
        return new Sale(
                id,
                Utils.getDate(date),
                services.watchesService.findById(watchId),
                services.sellersService.findById(sellerId),
                price,
                amount
        );
    }
}
