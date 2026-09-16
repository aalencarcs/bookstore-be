package com.example.test.controller.dto;

public record UserProgressResponse(
        Long id,
        Long bookId,
        int sectionId,
        int health
) {
}
