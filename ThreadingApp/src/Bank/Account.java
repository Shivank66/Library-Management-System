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
public class Account extends Thread {
    String accountno;
    int balance;

    public Account(String accountno, int balance) {
        this.accountno = accountno;
        this.balance = balance;
    }
    void withdraw(int amount)
    {
        if (amount>this.balance)
        
        this.balance -= amount;
    }
    void deposit(int amount)
    {
        this.balance += amount;
    }
    public  void withdrawDeposit(int amount,Account a2)
            //if we synchornized call method, then only one call will happen in particular time
            //but if we make a block synchronized ,then more one call can happen
    {
            
       // synchronized(this) //for synchronizing whole block
       
           synchronized(a2)
           {
        try{
         while(amount>this.balance);
        for(int i =0; i<=10; i++)
        {
            System.out.println(this + " is being transferred " + a2);
            Thread.sleep(200); 
        }
        
        this.withdraw(amount);
        a2.deposit(amount);
        System.out.println(this + " transferred " + a2);
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
           }
        }
    

    
    

    
    

    @Override
    public String toString() {
        return "Account{" + "accountno=" + accountno + ", balance=" + balance + '}';
    }
    
}
