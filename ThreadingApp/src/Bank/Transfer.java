/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bank;

/**
 *
 * @author maury
 */
public class Transfer extends Thread{
    int amount;
    Account a1,a2;

    public Transfer(int amount,Account a1, Account a2) {
        this.amount = amount;
        this.a1 = a1;
        this.a2 = a2;
        
    }

    @Override
    public void run() {
        System.out.println(a1 + " requested for transer" + a2);
        
        a1.withdrawDeposit(amount,a2);
        
    }
    public static void main(String args[])
    {
        
        Account a1 =  new Account("1",1000);
        Account a2 = new Account("2",2000);
        Account a3 = new Account("3",1000);
       // Account a4 = new Account("4",3000);
        int amount1=1001;
        Transfer t1= new Transfer(1001,a1,a2);
        Transfer t2 = new Transfer(200,a3,a1);
        t1.start();
        
        t2.start();
    
    
    }
    
}
