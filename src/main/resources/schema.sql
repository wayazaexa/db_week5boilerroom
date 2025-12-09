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
    end_date DATE NOT NULL DEFAULT CURRENT_DATE + 14
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


