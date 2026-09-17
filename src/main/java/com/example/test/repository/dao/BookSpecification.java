package com.example.test.repository.dao;

import com.example.test.model.Book;
import com.example.test.model.PossibleValues;
import org.springframework.data.jpa.domain.Specification;

import jakarta.persistence.criteria.Predicate;

import java.util.ArrayList;
import java.util.List;

public class BookSpecification {
    private BookSpecification() {
    }

    public static Specification<Book> byTitle(String title) {
        return (root, query, criteriaBuilder) -> {
            if (title == null || title.isBlank()) {
                return null;
            }

            return criteriaBuilder.like(criteriaBuilder.lower(root.get("title")), "%" + title.toLowerCase() + "%");
        };
    }

    public static Specification<Book> byListOfGenres(List<String> genres) {
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.in(root.get("genre")).value(genres));

    }

    public static Specification<Book> byListOfFilter(List<PossibleValues> values) {
        return (root, query, criteriaBuilder) -> {
            if (values == null || values.isEmpty()) {
                return null;
            }
            var predicates = new ArrayList<Predicate>();
            values.forEach(value -> {
                var predicate = criteriaBuilder
                        .in(root.get(value.field()))
                        .value(value.value());
                predicates.add(predicate);
            });

            return predicates.isEmpty() ? null : criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }
}
