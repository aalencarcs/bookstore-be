package com.example.test.controller.dto;

import com.example.test.enums.SectionType;

import java.util.List;

public record SectionResponse(
        Integer id,
        String text,
        SectionType type,
        List<StoryOptionResponse> options
) {
}
