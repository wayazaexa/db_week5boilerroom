package se.chasacademy.databaser.v5.boilerroom.repositories.mappers;

import org.springframework.jdbc.core.RowMapper;
import se.chasacademy.databaser.v5.boilerroom.models.Library;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LibraryRowMapper implements RowMapper<Library> {

    @Override
    public Library mapRow(ResultSet rs, int rowNum) throws SQLException {
        Library library = new Library();

        library.setLibrary_id(rs.getInt("library_id"));
        library.setName(rs.getString("name"));
        library.setAddress(rs.getString("address"));

        return library;
    }
}
