package com.example.test.repository;

import com.example.test.model.UserProgress;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<UserProgress, Long> {
    Optional<UserProgress> findByBookId(Long bookId);
}
