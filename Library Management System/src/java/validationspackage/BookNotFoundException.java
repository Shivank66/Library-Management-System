/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validationspackage;

/**
 *
 * @author maury
 */
public class BookNotFoundException extends Exception{

    public BookNotFoundException() {
        super("Book not found");
    }

    public BookNotFoundException(String message) {
        super(message);
    }
     public BookNotFoundException(int bookid) {
        super("Book with id " + bookid + " doesn't exist");
    }
}
