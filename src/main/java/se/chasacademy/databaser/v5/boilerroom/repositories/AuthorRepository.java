package se.chasacademy.databaser.v5.boilerroom.repositories;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;
import se.chasacademy.databaser.v5.boilerroom.models.Author;
@Repository
public class AuthorRepository {

    private final JdbcClient jdbcClient;

    public AuthorRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }

    //create author
    public int save(Author author) {
        return jdbcClient.sql("""
                
                        INSERT INTO author (name)
                VALUES (:name)
                """)
                .param("name", author.getName())
                .
update();

    }
    }
