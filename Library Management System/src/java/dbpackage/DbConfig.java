
package dbpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleDriver;

public class DbConfig {
    
    public static PreparedStatement getPreparedStatement(String query,HttpSession session) throws SQLException
    {
        return getConnection(session).prepareStatement(query);
    }
public static Connection getConnection(HttpSession session) throws SQLException
{
    
        if(session.getAttribute("connection")==null)
        {
    DriverManager.registerDriver(new OracleDriver());
    String user="library",password="library",url="jdbc:oracle:thin:@localhost:1521:xe";
    Connection connection=DriverManager.getConnection(url, user, password);
    session.setAttribute("connection", connection);
        }
        return (Connection)session.getAttribute("connection");
                
}
}
