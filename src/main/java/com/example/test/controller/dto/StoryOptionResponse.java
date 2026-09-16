package com.example.test.controller.dto;

public record StoryOptionResponse(
        Long id,
        String description,
        Integer gotoId,
        ConsequenceResponse consequence
) {
}
