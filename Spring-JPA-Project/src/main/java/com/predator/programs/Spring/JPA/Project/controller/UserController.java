package com.predator.programs.Spring.JPA.Project.controller;

import com.predator.programs.Spring.JPA.Project.model.User;
import com.predator.programs.Spring.JPA.Project.service.ProductService;
import com.predator.programs.Spring.JPA.Project.service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService; // To display products to users

    @GetMapping("/login")
    public String showUserLoginForm() {
        return "user-login"; // This will resolve to /WEB-INF/jsp/user-login.jsp
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        if (userService.authenticate(username, password)) {
            session.setAttribute("loggedInUser", username);
            return "redirect:/products"; // Redirect to user product view
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password.");
            return "redirect:/login";
        }
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "user-register"; // This will resolve to /WEB-INF/jsp/user-register.jsp
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user,
                               BindingResult result,
                               RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "user-register"; // This will resolve to /WEB-INF/jsp/user-register.jsp
        }
        if (userService.findByUsername(user.getUsername()).isPresent()) {
            result.rejectValue("username", "error.user", "Username already exists.");
            return "user-register"; // This will resolve to /WEB-INF/jsp/user-register.jsp
        }
        userService.registerUser(user);
        redirectAttributes.addFlashAttribute("message", "Registration successful! Please log in.");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/products")
    public String listProductsForUsers(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "product-view"; // This will resolve to /WEB-INF/jsp/product-view.jsp
    }

    // You might add a /products/{id} endpoint for viewing single product details
    // and potentially a /products/buy/{id} for buying functionality.
}
