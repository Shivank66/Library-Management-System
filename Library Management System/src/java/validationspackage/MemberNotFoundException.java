package validationspackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author maury
 */

public class MemberNotFoundException extends Exception {
    

    public MemberNotFoundException() {
        super("Member not found");
    }

    public MemberNotFoundException(String message) {
        super(message);
    }
     public MemberNotFoundException(int memberid) {
        super("Member with id " + memberid + " doesn't exist");
    }
     
     

    
}
