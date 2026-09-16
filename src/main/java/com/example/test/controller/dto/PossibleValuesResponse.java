package com.example.test.controller.dto;

import java.util.List;

public record PossibleValuesResponse(
        String field,
        List<Object> values
) {
}
