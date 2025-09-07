package com.predator.programs.Spring.JPA.Project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String redirectToUserLogin() {
        // Redirect to the user login page when the root URL is accessed
        return "redirect:/login";
    }
}
