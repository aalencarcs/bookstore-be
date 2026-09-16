package com.example.test.controller.dto;

import com.example.test.enums.ConsequenceType;

public record ConsequenceResponse(
        Long id,
        ConsequenceType type,
        Integer value,
        String text
) {
}
