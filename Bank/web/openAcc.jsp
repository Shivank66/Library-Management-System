<%-- 
    Document   : banking
    Created on : 12 Oct, 2021, 12:48:08 PM
    Author     : 2001s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbpackage.Dbconfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    String nam="";
    int amt=0;
    nam=request.getParameter("Name");
    amt=Integer.parseInt(request.getParameter("amount"));
    Connection connection=Dbconfig.getconnection();
    PreparedStatement statement=connection.prepareStatement("insert into bank values(next.nextval,?,?)");
    statement.setString(1,nam);
    statement.setString(2,amt+"");
    int n=statement.executeUpdate();
    
    
    
    %>


<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       </body>     
    
</html>
