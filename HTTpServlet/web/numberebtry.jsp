<%
boolean ispostback=false;
if(request.getParameter("check") != null)
ispostback=true;
if(ispostback)
{
    int n=Integer.parseInt(   request.getParameter("n"));
    //out.println("postback");
    request.setAttribute("n", n);
    RequestDispatcher dispatcher=request.getRequestDispatcher("checknumber.jsp");
    dispatcher.forward(request, response);
    
}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Number Entry</title>
    </head>
    <body>
        <h1>Enter Number</h1>
        <form method="post">
            <input type="hidden" name="check"/>
            N1<input type="number" name="n">
            <br>
            <input type="submit" value="Add"/>
            
            
        </form>
    </body>
</html>
