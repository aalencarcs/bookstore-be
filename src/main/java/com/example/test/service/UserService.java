package com.example.test.service;

import com.example.test.model.UserProgress;
import com.example.test.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public UserProgress getUserProgress(Long bookId){
        return userRepository.findByBookId(bookId)
                .orElse(null);
    }

    public UserProgress saveProgress(UserProgress userProgress) {
        return userRepository.findByBookId(userProgress.getBookId())
                .map(progress -> {
                    progress.setBookId(userProgress.getBookId());
                    progress.setHealth(userProgress.getHealth());
                    progress.setSectionId(userProgress.getSectionId());
                    return userRepository.save(progress);
                })
                .orElseGet(() -> userRepository.save(userProgress));
    }

}
