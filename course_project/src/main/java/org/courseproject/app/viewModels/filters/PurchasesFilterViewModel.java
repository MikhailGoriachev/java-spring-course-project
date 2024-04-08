package org.courseproject.app.viewModels.filters;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// Модель фильтра для выборки Закупок
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PurchasesFilterViewModel {

    // начальная дата закупки
    private String minDate;
    
    // конечная дата закупки
    private String maxDate;
}
