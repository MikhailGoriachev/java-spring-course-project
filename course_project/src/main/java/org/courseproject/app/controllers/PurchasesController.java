package org.courseproject.app.controllers;

import org.courseproject.app.middleware.Services;
import org.courseproject.app.utils.Utils;
import org.courseproject.app.viewModels.PurchaseViewModel;
import org.courseproject.app.viewModels.filters.PurchasesFilterViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/purchases")
public class PurchasesController {

    @Autowired
    private Services services;

    // все записи
    @GetMapping("")
    public ModelAndView getAll(ModelMap model) {
        model.addAttribute("title", "Закупки");
        model.addAttribute("items", services.purchasesService.findAll());

        return new ModelAndView("tables/purchases", "filter", new PurchasesFilterViewModel());
    }

    // закупки за указанный период
    @PostMapping("/by-date-between")
    public ModelAndView getAllByDateBetween(@ModelAttribute("SpringWeb") PurchasesFilterViewModel filter, ModelMap model) {

        var min = Utils.getDate(filter.getMinDate());
        var max = Utils.getDate(filter.getMaxDate());

        var isValid = max.getTime() - min.getTime() > 0;

        var title = String.format("Закупки. Период закупки от %s до %s. %s", 
                Utils.dateToFormat(min), 
                Utils.dateToFormat(max),
                isValid ? "" : "<br><span class='text-danger'>Диапазон даты невалиден</span>");
        
        model.addAttribute("title", title);
        model.addAttribute("items", services.purchasesService.findAllByDateBetween(min, max));

        return new ModelAndView("tables/purchases", "filter", filter);
    }

    // форма добавления
    @GetMapping("/store")
    public ModelAndView storeGet(ModelMap model) {
        model.addAttribute("isAdd", true);
        model.addAttribute("watchList", services.watchesService.findAll());

        return new ModelAndView("forms/purchase", "item", new PurchaseViewModel());
    }

    // обработка формы добавления
    @PostMapping("/store")
    public ModelAndView storePost(@ModelAttribute("SpringWeb") PurchaseViewModel item, ModelMap model) {

        var date = Utils.getDate(item.getDate());

        String errorMessage = "";

        if (date.getTime() > new Date().getTime())
            errorMessage = "Дата закупки не может быть позднее текущей даты";

        if (!errorMessage.isEmpty()) {
            model.addAttribute("isAdd", true);
            model.addAttribute("watchList", services.watchesService.findAll());

            model.addAttribute("errorMessage", errorMessage);

            return new ModelAndView("forms/purchase", "item", item);
        }


        services.purchasesService.store(item.toModel(services));

        return new ModelAndView("redirect:/purchases");
    }

    // форма редактирования
    @GetMapping("/update/{id}")
    public ModelAndView updateGet(@PathVariable("id") long id, ModelMap model) {
        model.addAttribute("isAdd", false);
        model.addAttribute("watchList", services.watchesService.findAll());

        var item = PurchaseViewModel.fromModel(services.purchasesService.findById(id));

        return new ModelAndView("forms/purchase", "item", item);
    }

    // обработка формы редактирования
    @PostMapping("/update")
    public ModelAndView updatePost(@ModelAttribute("SpringWeb") PurchaseViewModel item, ModelMap model) {

        var date = Utils.getDate(item.getDate());

        String errorMessage = "";

        if (date.getTime() > new Date().getTime())
            errorMessage = "Дата закупки не может быть позднее текущей даты";

        if (!errorMessage.isEmpty()) {
            model.addAttribute("isAdd", false);
            model.addAttribute("watchList", services.watchesService.findAll());

            model.addAttribute("errorMessage", errorMessage);

            return new ModelAndView("forms/purchase", "item", item);
        }
        
        services.purchasesService.update(item.toModel(services));

        return new ModelAndView("redirect:/purchases");
    }
}
