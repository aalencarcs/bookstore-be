package com.example.test.model;

import java.util.List;

public record PossibleValues(
        String field,
        List<Object> value
) {
}
