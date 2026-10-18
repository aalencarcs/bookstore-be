package com.example.test.controller.dto;

import java.io.Serializable;

public record StoryOptionResponse(
        Long id,
        String description,
        Integer gotoId,
        ConsequenceResponse consequence
) implements Serializable {
}
