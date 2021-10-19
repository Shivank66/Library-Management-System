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
    String check=request.getParameter("check");
    boolean isEmpty = true;
    if(check!=null)
        isEmpty=false;
    if(!isEmpty)
    {
     
    nam=request.getParameter("Name");
    amt=Integer.parseInt(request.getParameter("amount"));
    Connection connection=Dbconfig.getconnection();
    PreparedStatement statement=connection.prepareStatement("insert into bank values(next.nextval,?,?)");
    statement.setString(1,nam);
    statement.setInt(2,amt);
    int n=statement.executeUpdate();
    }
    
    
    
    %>


<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="openAcc.jsp" method="post">
        <label for="Name">Your Name:  </label>
        <input type="text" id="Name" name="Name" placeholder="Name">
        <label for="amount">Initial deposit: </label>
        <input type="number" name="amount" id="amount" placeholder="amount">
        <input type="submit" value="submit">
        <input type="hidden" name="check" id="check">    
        </form>
       </body>     
    
</html>
