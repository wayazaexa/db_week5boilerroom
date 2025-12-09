package se.chasacademy.databaser.v5.boilerroom.models;

public class LibraryLentCopiesAvailableCopies {
    private String libraryName;
    private int lentCpoies, availableCopies;

    public String getLibraryName() {
        return libraryName;
    }

    public void setLibraryName(String libraryName) {
        this.libraryName = libraryName;
    }

    public int getLentCpoies() {
        return lentCpoies;
    }

    public void setLentCpoies(int lentCpoies) {
        this.lentCpoies = lentCpoies;
    }

    public int getAvailableCopies() {
        return availableCopies;
    }

    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    }
}
