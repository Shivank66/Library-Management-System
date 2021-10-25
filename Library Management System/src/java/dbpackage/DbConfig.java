
package dbpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleDriver;

public class DbConfig {
    //static int key=0;
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
       return  (Connection)session.getAttribute("connection");
                
}
public static String getTable(String query,HttpSession session) throws SQLException
    {
        Connection connection=getConnection(session);
        PreparedStatement statement=connection.prepareStatement(query);
        String output="<table class='table-striped table-hover' >\n";
        ResultSet rs=statement.executeQuery();
        ResultSetMetaData rsmd=rs.getMetaData();
        int n= rsmd.getColumnCount();
        output+="\n<tr>";
            for(int i=1;i<=n;i++)
                output+="<th style=\"margin-right:100px;\">" + rsmd.getColumnLabel(i) + "</th>";
            output+="<th>Action</th></tr>\n";
        while(rs.next())
        {
            output+="\n<tr>";
            //String nam="" + rs.getObject(2);
            String key="" + rs.getObject(1);
            String nam1=""+rs.getObject(2);
            for(int i=1;i<=n;i++)
            {
                
                output+="<td style=\"margin-right:100px;\">" + rs.getObject(i) + "</td>";
            }
            output+="<td><a href='editusertype.jsp?key="+key+ "' target='edit'>Edit</a></td></tr>\n";
                
        }
        output+="</table>\n";
        return output;
        
    }


}
