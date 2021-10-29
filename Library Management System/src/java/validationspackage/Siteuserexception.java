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
public class Siteuserexception extends Exception {
    public Siteuserexception() {
        super("User not found");
    }

    public Siteuserexception(String message) {
        super(message);
    }
     public Siteuserexception(int userno) {
        super("User with id " + userno + " doesn't exist");
    }
     
     

    
}

