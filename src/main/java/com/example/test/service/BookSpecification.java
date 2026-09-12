package com.example.test.service;

import com.example.test.model.Book;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public class BookSpecification{
    public static Specification<Book> byTitle(String title) {
        return (root, query, criteriaBuilder) ->
                criteriaBuilder.like(root.get("title"), "%" + title + "%");
    }

    public static Specification<Book> byListOfGenres(List<String> genres){
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.in(root.get("genre")).value(genres));

    }
}
