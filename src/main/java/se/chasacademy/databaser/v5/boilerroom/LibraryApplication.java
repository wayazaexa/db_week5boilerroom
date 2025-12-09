package se.chasacademy.databaser.v5.boilerroom;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import se.chasacademy.databaser.v5.boilerroom.models.Author;
import se.chasacademy.databaser.v5.boilerroom.models.Book;
import se.chasacademy.databaser.v5.boilerroom.repositories.AuthorRepository;
import se.chasacademy.databaser.v5.boilerroom.repositories.BookRepository;

@SpringBootApplication
public class LibraryApplication implements CommandLineRunner {
    private AuthorRepository authorRepository;
    private BookRepository bookRepository;

	public LibraryApplication(AuthorRepository authorRepository,  BookRepository bookRepository) {
		/* Tom konstruktor för framtiden. */
        this.authorRepository = authorRepository;
        this.bookRepository = bookRepository;
    }

	public static void main(String[] args) {
		SpringApplication.run(LibraryApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("Välkommen till Bibliotek Z");

        Author author = new Author();
        author.setName("John Doe");
        authorRepository.save(author);

        Book book = new Book();
        book.setTitle("Spring JDBC Client in Action");
        book.setIsbn("123-456-789");
        book.setPublishing_year(2024);
        book.setCategory_id(1);
        bookRepository.save(book);
    }

	}

