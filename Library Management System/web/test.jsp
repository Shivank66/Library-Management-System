
<%@page import="bookpackage.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Page</title>
    </head>
    <body>
        <%
            try
            {
        //Book b=new Book(100, 2, "Advance C", "Lanka Publisher", "Pappu", "One");
        //out.println(b);
       // Book b1=new Book(1);
        //b1.setAuthor("Shivank");
        //b1.save();
        //Book.delete(9);
        //  out.println(b1);
            }
            catch(Exception ex)
            {
                out.println(ex.getMessage());
            }
        %>
    </body>
</html>
