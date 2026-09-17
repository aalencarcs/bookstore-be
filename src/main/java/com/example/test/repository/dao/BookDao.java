package com.example.test.repository.dao;

import com.example.test.model.Book;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Selection;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class BookDao {
    @PersistenceContext
    private EntityManager entityManager;

    public List<Object> findPossibleValues(String filed){
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        var query = criteriaBuilder.createQuery(Object.class);
        var root = query.from(Book.class);

        Selection<String> selection = root.get(filed);

        query.select(selection).distinct(true);

        return entityManager.createQuery(query)
                .getResultList();
    }
}
