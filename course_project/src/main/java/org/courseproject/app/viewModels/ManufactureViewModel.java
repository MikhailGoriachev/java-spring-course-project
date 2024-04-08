package org.courseproject.app.viewModels;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.courseproject.app.entries.Manufacture;
import org.courseproject.app.middleware.Services;

// Модель представления для Производителя
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ManufactureViewModel {

    private Long id;

    // наименование
    private String name;

    // id страны
    private Long countryId;


    // создать модель представления из модели
    public static ManufactureViewModel fromModel(Manufacture item) {
        return new ManufactureViewModel(
                item.getId(),
                item.getName(),
                item.getCountry().getId()
        );
    }
    
    // создать модель из модели представления
    public Manufacture toModel(Services services) {
        return new Manufacture(
                id,
                name,
                services.countriesService.findById(countryId)
        );
    }
}
