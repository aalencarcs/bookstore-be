package com.example.test.controller.dto;

import com.example.test.model.UserProgress;

public record UserProgressRequest(
        Long bookId,
        int sectionId,
        int health
) {

    public UserProgress toEntity(){
        return new UserProgress(
                null,
                this.bookId,
                this.health,
                this.sectionId
        );
    }

}
