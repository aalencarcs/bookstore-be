package com.example.test.service;

import com.example.test.model.Book;
import org.apache.commons.lang3.builder.DiffResult;
import org.apache.commons.lang3.builder.Diffable;

public class Testing implements Diffable<Book> {




    @Override
    public DiffResult<Book> diff(Book obj) {
        return null;
    }
}
