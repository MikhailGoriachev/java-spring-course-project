package org.courseproject.app.middleware;

import org.courseproject.app.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Services {
    
    // страны
    @Autowired
    public CountriesService countriesService;
    
    // производители
    @Autowired
    public ManufacturesService manufacturesService;
    
    // закупки
    @Autowired
    public PurchasesService purchasesService;
    
    // продажи
    @Autowired
    public SalesService salesService;
    
    // продавцы
    @Autowired
    public SellersService sellersService;
    
    // часы на складе
    @Autowired
    public StockWatchesService stockWatchesService;
    
    // часы
    @Autowired
    public WatchesService watchesService;
    
    // типы часов
    @Autowired
    public WatchTypesService watchTypesService;
}
