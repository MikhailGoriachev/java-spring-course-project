package org.courseproject.app.controllers;

import org.courseproject.app.middleware.Services;
import org.courseproject.app.utils.Utils;
import org.courseproject.app.viewModels.SaleViewModel;
import org.courseproject.app.viewModels.filters.SalesFilterViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/sales")
public class SalesController {

    @Autowired
    private Services services;

    // все записи
    @GetMapping("")
    public ModelAndView getAll(ModelMap model) {
        model.addAttribute("title", "Продажи");
        model.addAttribute("items", services.salesService.findAll());
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());

        return new ModelAndView("tables/sales", "filter", new SalesFilterViewModel());
    }

    // часы заданного типа, цена на которые в заданном диапазоне значений
    @PostMapping("/by-watch-type-and-price-between")
    public ModelAndView getAllByWatchTypeAndPriceBetween(@ModelAttribute("SpringWeb") SalesFilterViewModel filter, ModelMap model) {

        var type = filter.getWatchTypeName();
        var min = filter.getMinPrice();
        var max = filter.getMaxPrice();

        var isValid = max - min > 0;

        var title = String.format("Продажи. Тип часов \"%s\" и диапазон цены от %d &#8381; и до %d &#8381;. %s",
                type, min, max,
                isValid ? "" : "<br><span class='text-danger'>Диапазон цены невалиден</span>");

        model.addAttribute("title", title);
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());

        var items = services.salesService.findAllByWatchWatchTypeNameAndPriceBetween(type, min, max);

        model.addAttribute("items", items);

        return new ModelAndView("tables/sales", "filter", filter);
    }

    // продажи за указанный период
    @PostMapping("/by-date-between")
    public ModelAndView getAllByDateBetween(@ModelAttribute("SpringWeb") SalesFilterViewModel filter, ModelMap model) {
        var min = Utils.getDate(filter.getMinDate());
        var max = Utils.getDate(filter.getMaxDate());

        var isValid = max.getTime() - min.getTime() > 0;

        var title = String.format("Продажи. Период продажи от %s до %s. %s",
                Utils.dateToFormat(min),
                Utils.dateToFormat(max),
                isValid ? "" : "<br><span class='text-danger'>Диапазон даты невалиден</span>");

        model.addAttribute("title", title);
        model.addAttribute("watchTypeList", services.watchTypesService.findAll());
        model.addAttribute("items", services.salesService.findAllByDateBetween(min, max));

        return new ModelAndView("tables/sales", "filter", filter);
    }

    // форма добавления
    @GetMapping("/store")
    public ModelAndView storeGet(ModelMap model) {
        model.addAttribute("isAdd", true);
        model.addAttribute("watchList", services.stockWatchesService.getAllByDate(Utils.dateHtmlToFormat(new Date())));
        model.addAttribute("sellerList", services.sellersService.findAll());

        var item = new SaleViewModel();

        item.setDate(Utils.dateHtmlToFormat(new Date()));

        return new ModelAndView("forms/sale", "item", item);
    }

    // обработка формы добавления
    @PostMapping("/store")
    public ModelAndView storePost(@ModelAttribute("SpringWeb") SaleViewModel item, ModelMap model) {

        item.setDate(Utils.dateHtmlToFormat(new Date()));

        var stockAmount = services.stockWatchesService.getByDateAndId(item.getDate(), item.getWatchId()).getAmount();

        if (item.getAmount() > stockAmount) {
            model.addAttribute("isAdd", true);
            model.addAttribute("watchList", services.stockWatchesService.getAllByDate(item.getDate()));
            model.addAttribute("sellerList", services.sellersService.findAll());

            var errorMessage = String.format(
                    "Заданное количество для продажи (%d) не может превышать количества товара в наличии (%d)",
                    item.getAmount(),
                    stockAmount
            );

            model.addAttribute("errorMessage", errorMessage);

            return new ModelAndView("forms/sale", "item", item);
        }

        services.salesService.store(item.toModel(services));

        return new ModelAndView("redirect:/sales");
    }

    // форма редактирования
    @GetMapping("/update/{id}")
    public ModelAndView updateGet(@PathVariable("id") long id, ModelMap model) {
        model.addAttribute("isAdd", false);
        model.addAttribute("watchList", services.stockWatchesService.getAllByDate(Utils.dateHtmlToFormat(new Date())));
        model.addAttribute("sellerList", services.sellersService.findAll());

        var item = SaleViewModel.fromModel(services.salesService.findById(id));

        return new ModelAndView("forms/sale", "item", item);
    }

    // обработка формы редактирования
    @PostMapping("/update")
    public ModelAndView updatePost(@ModelAttribute("SpringWeb") SaleViewModel item, ModelMap model) {
        var stockAmount = services.stockWatchesService
                .getByDateAndIdWithoutSaleId(item.getDate(), item.getWatchId(), item.getId())
                .getAmount();
        
        var date = Utils.getDate(item.getDate());
        
        String errorMessage = "";

        if (item.getAmount() > stockAmount) {
            errorMessage = String.format(
                    "Заданное количество для продажи (%d) не может превышать количества товара в наличии (%d)",
                    item.getAmount(),
                    stockAmount
            );
        } else if (date.getTime() > new Date().getTime())
            errorMessage = "Дата продажи не может быть позднее текущей даты";
        
        if (!errorMessage.isEmpty()) {
            model.addAttribute("isAdd", false);
            model.addAttribute("watchList", services.watchesService.findAll());
            model.addAttribute("sellerList", services.sellersService.findAll());

            model.addAttribute("errorMessage", errorMessage);

            return new ModelAndView("forms/sale", "item", item);
        }

        services.salesService.update(item.toModel(services));

        return new ModelAndView("redirect:/sales");
    }

    // удаление записи
    @GetMapping("/delete/{id}")
    public String deleteGet(@PathVariable("id") long id) {
        services.salesService.deleteById(id);

        return "redirect:/sales";
    }
}
