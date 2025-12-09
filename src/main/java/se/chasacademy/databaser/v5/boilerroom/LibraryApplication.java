package se.chasacademy.databaser.v5.boilerroom;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import se.chasacademy.databaser.v5.boilerroom.repositories.BookRepository;
import se.chasacademy.databaser.v5.boilerroom.repositories.LibraryRepository;

@SpringBootApplication
public class LibraryApplication implements CommandLineRunner {
    private final BookRepository bookRepository;
    private final LibraryRepository libraryRepository;

	public LibraryApplication(BookRepository bookRepository, LibraryRepository libraryRepository) {
		this.bookRepository = bookRepository;
        this.libraryRepository = libraryRepository;
	}

	public static void main(String[] args) {
		SpringApplication.run(LibraryApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("Välkommen till Bibliotek Malmö1");

        // Antalet böcker utlånade respektive ej utlånade på de olika biblioteken.


        // Antalet böcker utlånade för alla bibliotek.
        // Antalet böcker ej utlånade för alla bibliotek.
        // Top 10 lista på populär böcker per bibliotek.
        // Top 10 lista på populär böcker för alla bibliotek.
        // Se hur många medborgare som lånat en eller flera böcker.
        // Se hur många böcker som aldrig blivit utlånade.
        // Se antalet böcker per kategori för alla bibliotek.
        // Se antalet böcker per kategori för varje bibliotek.
    }
}
