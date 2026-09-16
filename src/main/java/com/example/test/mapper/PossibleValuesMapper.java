package com.example.test.mapper;

import com.example.test.controller.dto.PossibleValuesResponse;
import com.example.test.model.PossibleValues;

public class PossibleValuesMapper {

    private PossibleValuesMapper() {
    }

    public static PossibleValuesResponse toPossibleValuesResponse(PossibleValues possibleValues){
        return new PossibleValuesResponse(
         possibleValues.field(),
         possibleValues.value()
        );
    }
}
