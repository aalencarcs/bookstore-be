package com.example.test.service;

import com.example.test.model.Book;
import com.example.test.repository.BookRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Root;
import jakarta.persistence.criteria.Selection;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookRepository bookRepository;

    @PersistenceContext
    private final EntityManager entityManager;
    public List<Book> findByTitle(String title){
        return bookRepository.findAll(BookSpecification.byTitle(title));
    }

    public List<Book> findAllBooks(){
        return bookRepository.findAll();
    }

    public List<Book> findAllByGenres(List<String> genres){
        return bookRepository.findAll(BookSpecification.byListOfGenres(genres));
    }

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
