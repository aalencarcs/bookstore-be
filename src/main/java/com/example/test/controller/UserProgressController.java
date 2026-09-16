package com.example.test.controller;

import com.example.test.controller.dto.UserProgressRequest;
import com.example.test.controller.dto.UserProgressResponse;
import com.example.test.model.UserProgress;
import com.example.test.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user-progress")
public class UserProgressController {

    private final UserService userService;

    @GetMapping("/{bookId}")
    public UserProgressResponse getProgressById(@PathVariable Long bookId){
        UserProgress userProgress = userService.getUserProgress(bookId);
        if(userProgress == null) return null;

        return new UserProgressResponse(userProgress.getId(),
                userProgress.getBookId(), userProgress.getSectionId(), userProgress.getHealth());
    }

    @PostMapping("/save")
    public UserProgress saveProgress(@RequestBody UserProgressRequest request){
        return userService.saveProgress(request.toEntity());
    }
}
