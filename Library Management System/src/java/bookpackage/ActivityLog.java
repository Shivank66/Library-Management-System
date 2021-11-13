
package bookpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;


public class ActivityLog {
    private int sno=-1;
    private int siteuserno=-1;
    private String Adate="";
    private String activity="";

    public ActivityLog(int siteuserno,String Activity,HttpSession session) {
        this.siteuserno=siteuserno;
   
        this.activity=Activity;
    }
    public void save(HttpSession session) throws SQLException
    {
         PreparedStatement statement=DbConfig.getPreparedStatement("insert into ActivityLog values(activitylogsequence.nextVal,?,?,to_char(systimestamp,'dd-mm-yyyy hh12:mi:ss.FF.AM'))",session );
    statement.setString(1, siteuserno+"");
    statement.setString(2, activity);
    //statement.setString(3, Adate);
    statement.executeUpdate();
    
    }

     
    
}
