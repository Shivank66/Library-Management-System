<%@page import="loginpackage.LoginManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Test</title>
    </head>
    <body>
        <h1>
            <%
                boolean b=LoginManager.isUserNameAndPasswordCorrect("shivank", "lanka", session);
                out.println(b);
            
            
            %>
        </h1>
    </body>
</html>
