package org.courseproject.app.controllers;

import org.courseproject.app.middleware.Services;
import org.courseproject.app.viewModels.WatchViewModel;
import org.courseproject.app.viewModels.filters.WatchesFilterViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/watches")
public class WatchesController {

    @Autowired
    private Services services;

    // все записи
    @GetMapping("")
    public ModelAndView getAll(ModelMap model) {
        model.addAttribute("title", "Часы");
        model.addAttribute("items", services.watchesService.findAll());
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());
        model.addAttribute("countryList", services.countriesService.findAll());

        return new ModelAndView("tables/watches", "filter", new WatchesFilterViewModel());
    }

    // часы заданного типа
    @PostMapping("/by-watch-type")
    public ModelAndView getAllByWatchType(@ModelAttribute("SpringWeb") WatchesFilterViewModel filter, ModelMap model) {
        var title = String.format("Часы. Тип часов \"%s\"", filter.getWatchTypeName());

        model.addAttribute("title", title);
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());
        model.addAttribute("countryList", services.countriesService.findAll());

        var items = services.watchesService.findAllByWatchTypeName(filter.getWatchTypeName());

        model.addAttribute("items", items);

        return new ModelAndView("tables/watches", "filter", filter);
    }

    // часы произведенных в заданной стране
    @PostMapping("/by-manufacture-country")
    public ModelAndView getAllByManufactureCountry(@ModelAttribute("SpringWeb") WatchesFilterViewModel filter, ModelMap model) {
        var title = String.format("Часы. Страна производителя \"%s\"", filter.getManufactureCountryName());

        model.addAttribute("title", title);
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());
        model.addAttribute("countryList", services.countriesService.findAll());

        var items = services.watchesService.findAllByManufactureCountryName(filter.getManufactureCountryName());

        model.addAttribute("items", items);

        return new ModelAndView("tables/watches", "filter", filter);
    }

    // товары на складе
    @GetMapping("/stock")
    public String getAllStock(ModelMap model) {
        model.addAttribute("title", "Часы на складе");
        model.addAttribute("items", services.stockWatchesService.findAll());
        
        return "queries/stockWatches";
    }
    
    
    // форма добавления
    @GetMapping("/store")
    public ModelAndView storeGet(ModelMap model) {
        model.addAttribute("isAdd", true);
        model.addAttribute("manufactureList", services.manufacturesService.findAll());
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());

        return new ModelAndView("forms/watch", "item", new WatchViewModel());
    }

    // обработка формы добавления
    @PostMapping("/store")
    public String storePost(@ModelAttribute("SpringWeb") WatchViewModel item) {
        services.watchesService.store(item.toModel(services));

        return "redirect:/watches";
    }

    // форма редактирования
    @GetMapping("/update/{id}")
    public ModelAndView updateGet(@PathVariable("id") long id, ModelMap model) {
        model.addAttribute("isAdd", false);
        model.addAttribute("manufactureList", services.manufacturesService.findAll());
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());
        
        var item = WatchViewModel.fromModel(services.watchesService.findById(id));

        return new ModelAndView("forms/watch", "item", item);
    }

    // обработка формы редактирования
    @PostMapping("/update")
    public String updatePost(@ModelAttribute("SpringWeb") WatchViewModel item) {
        services.watchesService.update(item.toModel(services));

        return "redirect:/watches";
    }
}
