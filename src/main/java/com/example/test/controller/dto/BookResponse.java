package com.example.test.controller.dto;

import com.example.test.enums.Difficulty;

import java.io.Serializable;
import java.util.List;

public record BookResponse(
        Long id,
        String title,
        String author,
        String genre,
        Difficulty difficulty,
        List<SectionResponse> sections
) implements Serializable {
}
