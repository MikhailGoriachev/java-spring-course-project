package org.courseproject.app.viewModels;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.courseproject.app.entries.Watch;
import org.courseproject.app.middleware.Services;

// Модель представления для Часов
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class WatchViewModel {

    private Long id;

    // название
    private String name;
    
    // производитель
    private Long manufactureId;

    // тип часов
    private Long watchTypeId;


    // создать модель представления из модели
    public static WatchViewModel fromModel(Watch item) {
        return new WatchViewModel(
                item.getId(),
                item.getName(),
                item.getManufacture().getId(),
                item.getWatchType().getId()
        );
    }
    
    // создать модель из модели представления
    public Watch toModel(Services services) {
        return new Watch(
                id,
                name,
                services.manufacturesService.findById(manufactureId),
                services.watchTypesService.findById(watchTypeId)
        );
    }
}
