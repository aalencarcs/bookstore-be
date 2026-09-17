package com.example.test.repository.dao;

import com.example.test.model.Book;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

public class BookSpecification{
    private BookSpecification() {
    }

    public static Specification<Book> byTitle(String title) {
        return (root, query, criteriaBuilder) ->{
            if(title == null || title.isBlank()){
                return null;
            }

            return criteriaBuilder.like(criteriaBuilder.lower(root.get("title")), "%" + title.toLowerCase() + "%");
        };
    }

    public static Specification<Book> byListOfGenres(List<String> genres){
        return ((root, query, criteriaBuilder) ->
                criteriaBuilder.in(root.get("genre")).value(genres));

    }
}
