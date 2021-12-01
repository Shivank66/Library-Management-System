
package threadingapp;

import java.util.logging.Level;
import java.util.logging.Logger;

public class CountingThread extends Thread{
    public void run()
    {
        for(int i=1;i<=10;i++)
        {
            try {
                System.out.println(i);
                Thread.sleep(500);
            } catch (InterruptedException ex) {
                System.err.println(ex);
            }
        }
    }
}
