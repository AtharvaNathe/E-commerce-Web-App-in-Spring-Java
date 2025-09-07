    package com.predator.programs.Spring.JPA.Project.service;

    import com.predator.programs.Spring.JPA.Project.model.AdminUser;
    import com.predator.programs.Spring.JPA.Project.repository.AdminUserRepository;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.Optional;

    @Service
    public class AdminUserService {

        @Autowired
        private AdminUserRepository adminUserRepository;

        public boolean authenticate(String username, String password) {
            Optional<AdminUser> adminUserOptional = adminUserRepository.findByUsername(username);
            return adminUserOptional.map(adminUser -> adminUser.getPassword().equals(password)).orElse(false);
        }

        public AdminUser saveAdminUser(AdminUser adminUser) {
            return adminUserRepository.save(adminUser);
        }
    }
    