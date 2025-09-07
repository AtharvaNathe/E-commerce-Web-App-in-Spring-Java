package com.predator.programs.Spring.JPA.Project.config;

import com.predator.programs.Spring.JPA.Project.interceptor.AdminAuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private AdminAuthInterceptor adminAuthInterceptor;

    // If you want to protect user-specific paths, you'd add a UserAuthInterceptor here
    // @Autowired
    // private UserAuthInterceptor userAuthInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminAuthInterceptor)
                .addPathPatterns("/admin/**") // Apply to all admin paths
                .excludePathPatterns("/admin/login", "/admin/setup-initial-admin"); // Exclude login and setup

        // Example for user interceptor (if you create one)
        // registry.addInterceptor(userAuthInterceptor)
        //         .addPathPatterns("/user/**", "/products/buy/**") // Apply to user-specific paths
        //         .excludePathPatterns("/login", "/register", "/products"); // Exclude public paths
    }
}
