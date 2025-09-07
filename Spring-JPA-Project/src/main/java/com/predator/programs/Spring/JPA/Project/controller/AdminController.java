package com.predator.programs.Spring.JPA.Project.controller;

import com.predator.programs.Spring.JPA.Project.model.AdminUser;
import com.predator.programs.Spring.JPA.Project.service.AdminUserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {

    @Autowired
    private AdminUserService adminUserService;

    @GetMapping("/admin/login")
    public String showLoginForm() {
        return "admin-login"; // This will resolve to /WEB-INF/jsp/admin-login.jsp
    }

    @PostMapping("/admin/login")
    public String login(@RequestParam String username,
                            @RequestParam String password,
                            HttpSession session,
                            RedirectAttributes redirectAttributes) {
        if (adminUserService.authenticate(username, password)) {
            session.setAttribute("loggedInAdmin", username);
            return "redirect:/admin/products";
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password.");
            return "redirect:/admin/login";
        }
    }

    @GetMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }

    // A simple endpoint to create an initial admin user (for testing/setup)
    @GetMapping("/admin/setup-initial-admin")
    public String setupInitialAdmin(RedirectAttributes redirectAttributes) {
        // Only create if no admin user exists
        if (adminUserService.authenticate("admin", "password") == false) { // Check if default admin exists
            AdminUser admin = new AdminUser("admin", "password"); // In real app, hash this password
            adminUserService.saveAdminUser(admin);
            redirectAttributes.addFlashAttribute("message", "Initial admin user 'admin' with password 'password' created.");
        } else {
            redirectAttributes.addFlashAttribute("message", "Admin user already exists.");
        }
        return "redirect:/admin/login";
    }
}
