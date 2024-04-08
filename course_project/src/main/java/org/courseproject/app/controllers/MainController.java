package org.courseproject.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    // главная
    @GetMapping("/")
    public String showIndex() {
        return "index";
    }

    // о разработчике
    @GetMapping("/about")
    public String showAbout() {
        return "about";
    }
}
