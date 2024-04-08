package org.courseproject.app.viewModels;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.courseproject.app.entries.Purchase;
import org.courseproject.app.middleware.Services;
import org.courseproject.app.utils.Utils;

// Модель представления для Закупки
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseViewModel {

    private Long id;

    // дата закупки
    private String date;

    // часы
    private Long watchId;

    // цена
    private int price;

    // количество
    private int amount;


    // создать модель представления из модели
    public static PurchaseViewModel fromModel(Purchase item) {
        return new PurchaseViewModel(
                item.getId(),
                Utils.dateHtmlToFormat(item.getDate()),
                item.getWatch().getId(),
                item.getPrice(),
                item.getAmount()
        );
    }
    
    // создать модель из модели представления
    public Purchase toModel(Services services) {
        return new Purchase(
                id,
                Utils.getDate(date),
                services.watchesService.findById(watchId),
                price,
                amount
        );
    }
}
