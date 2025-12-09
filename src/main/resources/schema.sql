DROP TABLE IF EXISTS Member_Loan CASCADE;
DROP TABLE IF EXISTS Member CASCADE;
DROP TABLE IF EXISTS Loan_Book_copy CASCADE;
DROP TABLE IF EXISTS Loan CASCADE;
DROP TABLE IF EXISTS Librarian CASCADE;
DROP TABLE IF EXISTS Book_copy CASCADE;
DROP TABLE IF EXISTS Library CASCADE;
DROP TABLE IF EXISTS Book_Author CASCADE;
DROP TABLE IF EXISTS Book CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Author CASCADE;

CREATE TABLE Author (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Book (
    book_id SERIAL PRIMARY KEY,
    isbn VARCHAR(50),
    title VARCHAR(100) NOT NULL,
    publishing_year INT NOT NULL,
    category_id INT NOT NULL REFERENCES Category(category_id)
);

CREATE TABLE Book_Author (
    book_id INT NOT NULL REFERENCES Book(book_id),
    author_id INT NOT NULL REFERENCES Author(author_id),
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE Library (
    library_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL
);

CREATE TABLE Book_copy (
    book_copy_id SERIAL PRIMARY KEY,
    quantity INT CONSTRAINT quantity_constraint CHECK (quantity >= 0) NOT NULL,
    book_id INT NOT NULL REFERENCES Book(book_id),
    library_id INT NOT NULL REFERENCES Library(library_id)
);

CREATE TABLE Librarian (
    librarian_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    library_id INT NOT NULL REFERENCES Library(library_id)
);

CREATE TABLE Loan (
    loan_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    end_date DATE NOT NULL DEFAULT CURRENT_DATE + 14,
	status VARCHAR(20) NOT NULL DEFAULT 'ongoing'
);

CREATE TABLE Loan_Book_copy (
    loan_id INT NOT NULL REFERENCES Loan(loan_id),
    book_copy_id INT NOT NULL REFERENCES Book_copy(book_copy_id),
    PRIMARY KEY (loan_id, book_copy_id)
);

CREATE TABLE Member (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Member_Loan (
    member_id INT NOT NULL REFERENCES Member(member_id),
    loan_id INT NOT NULL REFERENCES Loan(loan_id),
    PRIMARY KEY (member_id, loan_id)
);



-- ===============================
-- AUTHORS
-- ===============================
INSERT INTO Author(name) VALUES
('Agatha Christie'),
('J.K. Rowling'),
('George Orwell'),
('Isaac Asimov'),
('Mary Shelley'),
('J.R.R. Tolkien');

-- ===============================
-- CATEGORIES
-- ===============================
INSERT INTO Category(name) VALUES
('Mystery'),
('Fantasy'),
('Science Fiction'),
('Dystopian'),
('Horror');

-- ===============================
-- BOOKS
-- (isbn, title, year, category)
-- ===============================
INSERT INTO Book(isbn, title, publishing_year, category_id) VALUES
('9780007119356', 'Murder on the Orient Express', 1934, 1),
('9780747532743', 'Harry Potter and the Philosopher''s Stone', 1997, 2),
('9780451524935', '1984', 1949, 4),
('9780553293357', 'Foundation', 1951, 3),
('9780486282114', 'Frankenstein', 1818, 5),
('9780261102385', 'The Hobbit', 1937, 2),
('9780007120833', 'And Then There Were None', 1939, 1),
('9780439064873', 'Harry Potter and the Chamber of Secrets', 1998, 2),
('9780451526342', 'Animal Farm', 1945, 4),
('9780553382563', 'I, Robot', 1950, 3);

-- ===============================
-- BOOK AUTHORS (many-to-many)
-- ===============================
INSERT INTO Book_Author VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 1),
(8, 2),
(9, 3),
(10, 4);

-- ===============================
-- LIBRARIES
-- ===============================
INSERT INTO Library(name, address) VALUES
('Central Library', 'Main St 1'),
('North Branch', 'Oak Street 22'),
('South Branch', 'Pine Road 15');

-- ===============================
-- BOOK COPIES (inventory)
-- ===============================
INSERT INTO Book_copy(quantity, book_id, library_id) VALUES
(5, 1, 1),
(3, 2, 1),
(2, 3, 1),
(4, 4, 2),
(1, 5, 2),
(6, 6, 2),
(2, 7, 3),
(3, 8, 3),
(2, 9, 3),
(5, 10, 1),
(1, 5, 1),
(2, 4, 3);

-- ===============================
-- LIBRARIANS
-- ===============================
INSERT INTO Librarian(name, library_id) VALUES
('Anna Svensson', 1),
('Per Karlsson', 1),
('Maria Larsson', 2),
('Oskar Nilsson', 3);

-- ===============================
-- MEMBERS
-- ===============================
INSERT INTO Member(name, email) VALUES
('Alice Andersson', 'alice@example.com'),
('Bob Berg', 'bob@example.com'),
('Charlie Carlsson', 'charlie@example.com'),
('Diana Dahl', 'diana@example.com'),
('Erik Ek', 'erik@example.com'),
('Frida Frost', 'frida@example.com');

-- ===============================
-- LOANS
-- ===============================
INSERT INTO Loan(start_date, end_date, status) VALUES
(CURRENT_DATE - 10, CURRENT_DATE + 4, 'ongoing'),
(CURRENT_DATE - 5, CURRENT_DATE + 9, 'ongoing'),
(CURRENT_DATE - 1, CURRENT_DATE + 13, 'ongoing'),
(CURRENT_DATE - 20, CURRENT_DATE - 6, 'returned'),
(CURRENT_DATE - 20, CURRENT_DATE - 6, 'late'), -- already late
(CURRENT_DATE, CURRENT_DATE + 14, 'ongoing');

-- ===============================
-- LOAN → BOOK COPIES
-- ===============================
INSERT INTO Loan_Book_copy VALUES
(1, 1),  -- loan 1: Murder on the Orient Express
(1, 10), -- loan 1: I, Robot
(2, 3),  -- loan 2: 1984
(3, 8),  -- loan 3: Harry Potter 2
(4, 5),  -- loan 4: Frankenstein
(5, 6),  -- loan 5: The Hobbit
(6, 10); -- loan 6: I, Robot

-- ===============================
-- MEMBER → LOAN
-- ===============================
INSERT INTO Member_Loan VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 6);

