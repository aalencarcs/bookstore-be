create table user_progress
(
    id      bigserial primary key,
    book_id bigserial,
    health  int,
    section_id int
);