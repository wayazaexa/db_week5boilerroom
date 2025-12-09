package se.chasacademy.databaser.v5.boilerroom.repositories;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

@Repository
public class LibraryRepository {
    private final JdbcClient jdbcClient;

    public LibraryRepository(JdbcClient jdbcClient) {
        this.jdbcClient = jdbcClient;
    }
}
