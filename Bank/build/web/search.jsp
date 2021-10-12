<%-- 
    Document   : search
    Created on : 12 Oct, 2021, 1:43:10 PM
    Author     : 2001s
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbpackage.Dbconfig"%>
<%@page import="dbpackage.Account"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
    int account=0;
    
    
    String result="",butt="";
    String check=request.getParameter("check");
    boolean empty=true;
    if(check==null)
        empty=false;
    if(empty)
    {
    butt=request.getParameter("cmd");
    
    if(butt.equals("btn"))
    {
        try{
    account=Integer.parseInt(request.getParameter("acc"));
    Account a=new Account(account);
    result=""+a;
    }
    catch(Exception ex){
        result="exception";
        System.out.println(ex);
        
    }}}
    //System.out.println(a);
   
    
    
    
    
    
     
    
    %>
<html>
    <head>
        <title>Bank yahin Banega</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <form action="openAcc.jsp" method="post">
        <label for="Name">Your Name:  </label>
        <input type="text" id="Name" name="Name" placeholder="Name">
        <label for="amount">Initial deposit: </label>
        <input type="number" name="amount" id="amount" placeholder="amount">
        <input type="submit" value="submit">
      </form>
`
        
        <form action="search.jsp" method="post">
            <input type="hidden" name="check">
        <label for="acc">Account No.</label>
        <input type="number" id="acc" name="acc" placeholder="Account No.">
        
        
        <button type="submit" value="btn" name="cmd" id="cmd">Submit</button>
        <div> 
            <br>
            <h1>Aaja bhai</h1>
            <%=result%>
        </div>    

      </form>
        
    </body>
</html>

