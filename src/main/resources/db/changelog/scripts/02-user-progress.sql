--liquibase formatted sql
--changeset R43:1

create table user_progress
(
    id      bigserial primary key,
    book_id bigserial,
    health  int,
    section_id int
);

--rollback drop table user_progress;