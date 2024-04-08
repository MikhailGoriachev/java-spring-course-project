package org.courseproject.app.controllers;

import org.courseproject.app.middleware.Services;
import org.courseproject.app.viewModels.ManufactureViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manufactures")
public class ManufacturesController {

    @Autowired
    private Services services;

    // все записи
    @GetMapping("")
    public String getAll(ModelMap model) {
        model.addAttribute("title", "Производители");
        model.addAttribute("items", services.manufacturesService.findAll());

        return "tables/manufactures";
    }

    // форма добавления
    @GetMapping("/store")
    public ModelAndView storeGet(ModelMap model) {
        model.addAttribute("isAdd", true);
        model.addAttribute("countryList", services.countriesService.findAll());

        return new ModelAndView("forms/manufacture", "item", new ManufactureViewModel());
    }

    // обработка формы добавления
    @PostMapping("/store")
    public String storePost(@ModelAttribute("SpringWeb") ManufactureViewModel item) {
        services.manufacturesService.store(item.toModel(services));

        return "redirect:/manufactures";
    }

    // форма редактирования
    @GetMapping("/update/{id}")
    public ModelAndView updateGet(@PathVariable("id") long id, ModelMap model) {
        model.addAttribute("isAdd", false);
        model.addAttribute("countryList", services.countriesService.findAll());
        
        var item = ManufactureViewModel.fromModel(services.manufacturesService.findById(id));

        return new ModelAndView("forms/manufacture", "item", item);
    }

    // обработка формы редактирования
    @PostMapping("/update")
    public String updatePost(@ModelAttribute("SpringWeb") ManufactureViewModel item) {
        services.manufacturesService.update(item.toModel(services));

        return "redirect:/manufactures";
    }
}
