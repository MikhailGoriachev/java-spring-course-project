package org.courseproject.app.viewModels.filters;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// Модель фильтра для выборки Часов
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class WatchesFilterViewModel {

    // наименование типа часов
    private String watchTypeName;
    
    // страна производителя
    private String manufactureCountryName;
}
