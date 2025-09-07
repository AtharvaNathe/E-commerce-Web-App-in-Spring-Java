package com.predator.programs.Spring.JPA.Project.service;

import com.predator.programs.Spring.JPA.Project.model.User;
import com.predator.programs.Spring.JPA.Project.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean authenticate(String username, String password) {
        Optional<User> userOptional = userRepository.findByUsername(username);
        return userOptional.map(user -> user.getPassword().equals(password)).orElse(false);
    }

    public User registerUser(User user) {
        // In a real application, you would hash the password before saving
        return userRepository.save(user);
    }

    public Optional<User> findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
