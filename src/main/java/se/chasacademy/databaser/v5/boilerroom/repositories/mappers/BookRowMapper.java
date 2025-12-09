package se.chasacademy.databaser.v5.boilerroom.repositories.mappers;

import org.springframework.jdbc.core.RowMapper;
import se.chasacademy.databaser.v5.boilerroom.models.Book;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BookRowMapper implements RowMapper<Book> {

    @Override
    public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
        Book book = new Book();

        book.setBook_id(rs.getInt("book_id"));
        book.setPublishing_year(rs.getInt("publishing_year"));
        book.setCategory_id(rs.getInt("category_id"));
        book.setTitle(rs.getString("title"));
        book.setIsbn(rs.getString("isbn"));

        return book;
    }
}
