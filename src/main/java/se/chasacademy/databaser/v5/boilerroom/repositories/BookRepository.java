package se.chasacademy.databaser.v5.boilerroom.repositories;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;
import se.chasacademy.databaser.v5.boilerroom.models.Book;

@Repository
public class BookRepository {
    private final JdbcClient jdbcClient;

    public BookRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    // create book
    public int save(Book book) {
        return jdbcClient.sql("""
                INSERT INTO book (title, isbn, publishing_year, category_id)
                VALUES (:title, :isbn, :publishingYear, :categoryId)
                """)
                .param("title", book.getTitle())
                .param("isbn", book.getIsbn())
                .param("publishingYear", book.getPublishing_year())
                .param("categoryId", book.getCategory_id())
                .update();
    }
}

