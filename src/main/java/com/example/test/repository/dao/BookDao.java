package com.example.test.repository.dao;

import com.example.test.model.Book;
import com.example.test.model.PossibleValues;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Selection;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;
import java.util.Set;

@Component
public class BookDao {
    private static Set<String> FIELDS_TO_POSSIBLE_VALUES = Set.of(
            "genre", "difficulty"
    );

    @PersistenceContext
    private EntityManager entityManager;


    public List<PossibleValues> getAllPossibleValues() {
        return FIELDS_TO_POSSIBLE_VALUES.stream()
                .map(this::findPossibleValues)
                .toList();
    }

    private PossibleValues findPossibleValues(String filed) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        var query = criteriaBuilder.createQuery(Object.class);
        var root = query.from(Book.class);

        Selection<Object> selection = root.get(filed);

        query.select(selection).distinct(true);

        List<Object> values = entityManager.createQuery(query)
                .getResultList();

        return new PossibleValues(
                filed,
                values
        );
    }
}
