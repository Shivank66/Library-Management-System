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
    //Class that manages the database connectivity for the project.
    //We are currently using Oracle 10 XE(Express Edition) and the Oracle Thin Driver
    //If database is to be changed then this is the only file that needs changing
    
    public static PreparedStatement getPreparedStatement(String query,HttpSession session) throws SQLException
    {
        //Create and return a PreparedStatement taking a query as input.
        //We need the session because the connection is stored in the session
        return getConnection(session).prepareStatement(query);
    }
public static Connection getConnection(HttpSession session) throws SQLException
{
    //Create a connection, store it in the session. Since session is stored on a a per user basis
    //we will be having one connection per user.
        if(session.getAttribute("connection")==null)
        {
    DriverManager.registerDriver(new OracleDriver());
    String user="library",password="library",url="jdbc:oracle:thin:@localhost:1521:xe";
    Connection connection=DriverManager.getConnection(url, user, password);
    session.setAttribute("connection", connection);
        }
       return  (Connection)session.getAttribute("connection");
}
public static String getTable(String query,String extra_column_name,String column_value, String jspfilename,HttpSession session) throws SQLException
    {
        //Take a select query and return a table based on this and also takes name of extra column,with given value and link
        Connection connection=getConnection(session);
        PreparedStatement statement=connection.prepareStatement(query);
        String output="<table id=\"tableid\" name=\"tableid\" class='table-striped table-hover' >\n";
        ResultSet rs=statement.executeQuery();
        ResultSetMetaData rsmd=rs.getMetaData();
        int n= rsmd.getColumnCount();
        output+="\n<tr>";
            for(int i=1;i<=n;i++)
                output+="<th style=\"margin-right:100px;\">" +" &nbsp;  "+ rsmd.getColumnLabel(i)+" &nbsp; &nbsp;  " ;
            output+="<th>"+extra_column_name+"</th></tr>\n";
        while(rs.next())
        {
            output+="\n<tr>";
            //String nam="" + rs.getObject(2);
            String key="" + rs.getObject(1);
            String nam1=""+rs.getObject(2);
            for(int i=1;i<=n;i++)
            {
                
                output+="<td style=\"margin-right:100px;\">" +"  &nbsp;  "+ rs.getObject(i)+" &nbsp; &nbsp;  " + "</td>";
            }
            output+="<td><a href='"+jspfilename+"?key="+key+ "' target=''>"+column_value+"</a> &nbsp;</td></tr>\n";
                
        }
        output+="</table>\n";
        return output;
        
    }


}
