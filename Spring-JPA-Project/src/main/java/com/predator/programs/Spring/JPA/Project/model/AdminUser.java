    package com.predator.programs.Spring.JPA.Project.model;

    import jakarta.persistence.Column;
    import jakarta.persistence.Entity;
    import jakarta.persistence.GeneratedValue;
    import jakarta.persistence.GenerationType;
    import jakarta.persistence.Id;
    import jakarta.persistence.Table;
    import jakarta.validation.constraints.NotBlank;

    @Entity
    @Table(name = "admin_users")
    public class AdminUser {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @NotBlank(message = "Username is required")
        @Column(name = "username", unique = true, nullable = false)
        private String username;

        @NotBlank(message = "Password is required")
        @Column(name = "password", nullable = false)
        private String password; // In a real application, store hashed passwords

        // Constructors
        public AdminUser() {
        }

        public AdminUser(String username, String password) {
            this.username = username;
            this.password = password;
        }

        // Getters and Setters
        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }
    }
    