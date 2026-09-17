package com.example.test.service;

import com.example.test.model.Book;
import com.example.test.repository.BookRepository;
import com.example.test.repository.dao.BookDao;
import com.example.test.repository.dao.BookSpecification;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookService {

    private final BookRepository bookRepository;
    private final BookDao bookDao;
    
    public List<Book> findByTitle(String title){
        return bookRepository.findAll(BookSpecification.byTitle(title));
    }

    public List<Book> findAllBooks(){
        return bookRepository.findAll();
    }

    public List<Book> findByGenre(List<String> genre){
        return bookRepository.findAll(BookSpecification.byListOfGenres(genre));
    }

    public List<Object> getPossibleValues(String field){
        return bookDao.findPossibleValues(field);
    }
}
