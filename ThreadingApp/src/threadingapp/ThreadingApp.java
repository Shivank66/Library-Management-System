/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package threadingapp;

/**
 *
 * @author maury
 */
public class ThreadingApp {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CountingThread ct1=new CountingThread();
        CountingThread ct2=new CountingThread();
        ct1.start();
        ct2.start();
    }
    
}
