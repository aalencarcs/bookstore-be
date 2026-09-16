package com.example.test.controller;

import com.example.test.controller.dto.PossibleValuesResponse;
import com.example.test.mapper.PossibleValuesMapper;
import com.example.test.model.Book;
import com.example.test.model.PossibleValues;
import com.example.test.service.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class BookController {

    private final BookService bookService;

    @GetMapping("/byTitle")
    public List<Book> findByTitle(@RequestParam String title) {
        return bookService.findByTitle(title);
    }

    @GetMapping("/findAll")
    public List<Book> findAll() {
        return bookService.findAllBooks();
    }

    @GetMapping("/findAllByGenres")
    public List<Book> findAllByGenres(
            @RequestParam List<String> genres
    ) {
        return bookService.findAllByGenres(genres);
    }

    @GetMapping("/possibleValues/{field}")
    public List<Object> getPossibleValues(@PathVariable String field){
        return bookService.findPossibleValues(field);
    }
}
