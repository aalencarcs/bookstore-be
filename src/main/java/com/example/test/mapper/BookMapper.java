package com.example.test.mapper;

import com.example.test.controller.dto.ConsequenceResponse;
import com.example.test.controller.dto.BookResponse;
import com.example.test.controller.dto.SectionResponse;
import com.example.test.controller.dto.StoryOptionResponse;
import com.example.test.model.Consequence;
import com.example.test.model.Book;
import com.example.test.model.Section;
import com.example.test.model.StoryOption;

import java.util.List;

public class BookMapper {

    private BookMapper() {
    }

    public static List<BookResponse> toBookResponseList(List<Book> books) {
        return books.stream()
                .map(BookMapper::toBookResponse)
                .toList();
    }

    public static BookResponse toBookResponse(Book book) {
        return new BookResponse(
                book.getId(),
                book.getTitle(),
                book.getAuthor(),
                book.getGenre(),
                book.getDifficulty(),
                toSectionResponseList(book.getSections())
        );
    }

    private static SectionResponse toSectionResponse(Section section) {
        return new SectionResponse(
                section.getId(),
                section.getText(),
                section.getType(),
                toStoryOptionResponseList(section.getOptions())
        );
    }

    private static StoryOptionResponse toStoryOptionResponse(StoryOption storyOption) {
        return new StoryOptionResponse(
                storyOption.getId(),
                storyOption.getDescription(),
                storyOption.getGotoId(),
                toConsequenceResponse(storyOption.getConsequence())
        );
    }

    private static ConsequenceResponse toConsequenceResponse(Consequence consequence) {
        if (consequence == null) {
            return null;
        }
        return new ConsequenceResponse(
                consequence.getId(),
                consequence.getType(),
                consequence.getValue(),
                consequence.getText()
        );
    }

    private static List<SectionResponse> toSectionResponseList(List<Section> sections) {
        return sections.stream()
                .map(BookMapper::toSectionResponse)
                .toList();
    }

    private static List<StoryOptionResponse> toStoryOptionResponseList(List<StoryOption> storyOptions) {
        return storyOptions.stream()
                .map(BookMapper::toStoryOptionResponse)
                .toList();
    }
}
