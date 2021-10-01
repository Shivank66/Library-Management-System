
package dbpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import oracle.jdbc.OracleDriver;

public class DbConfig {
public static Connection getConnection() throws SQLException
{
    DriverManager.registerDriver(new OracleDriver());
    String user="library",password="library",url="jdbc:oracle:thin:@localhost:1521:xe";
    Connection connection=DriverManager.getConnection(url, user, password);
    return connection;
}
}
