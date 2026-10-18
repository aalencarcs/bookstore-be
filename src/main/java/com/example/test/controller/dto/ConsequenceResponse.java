package com.example.test.controller.dto;

import com.example.test.enums.ConsequenceType;

import java.io.Serializable;

public record ConsequenceResponse(
        Long id,
        ConsequenceType type,
        Integer value,
        String text
) implements Serializable {
}
