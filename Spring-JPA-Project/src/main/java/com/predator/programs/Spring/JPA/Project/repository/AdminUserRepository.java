    package com.predator.programs.Spring.JPA.Project.repository;

    import com.predator.programs.Spring.JPA.Project.model.AdminUser;
    import org.springframework.data.jpa.repository.JpaRepository;
    import org.springframework.stereotype.Repository;

    import java.util.Optional;

    @Repository
    public interface AdminUserRepository extends JpaRepository<AdminUser, Long> {
        Optional<AdminUser> findByUsername(String username);
    }
    