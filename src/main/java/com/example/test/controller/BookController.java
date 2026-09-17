package com.example.test.controller;

import com.example.test.controller.dto.BookResponse;
import com.example.test.mapper.BookMapper;
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
    public List<BookResponse> findByTitle(@RequestParam String title) {
        return BookMapper.toBookResponseList(bookService.findByTitle(title));
    }

    @GetMapping("/findAll")
    public List<BookResponse> findAll() {
        return BookMapper.toBookResponseList(bookService.findAllBooks());
    }

    @GetMapping("/findAllByGenres")
    public List<BookResponse> findAllByGenres(
            @RequestParam List<String> genres){
        return BookMapper.toBookResponseList(bookService.findByGenre(genres));
    }

    @GetMapping("/possibleValues/{field}")
    public List<Object> getPossibleValues(@PathVariable String field){
        return bookService.getPossibleValues(field);
    }
}
