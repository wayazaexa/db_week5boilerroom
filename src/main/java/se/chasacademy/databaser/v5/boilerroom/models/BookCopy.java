package se.chasacademy.databaser.v5.boilerroom.models;

public class BookCopy {
    private int book_copy_id, quantity, book_id, library_id;

    public int getBook_copy_id() {
        return book_copy_id;
    }

    public void setBook_copy_id(int book_copy_id) {
        this.book_copy_id = book_copy_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getLibrary_id() {
        return library_id;
    }

    public void setLibrary_id(int library_id) {
        this.library_id = library_id;
    }
}
