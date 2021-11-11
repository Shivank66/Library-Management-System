<%@page import="bookpackage.BookIssue"%>
<%@page import="loginpackage.LoginManager"%>
<%@page import="bookpackage.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
    </head>
    <body>
        <%
            try
            {
                BookIssue b= new BookIssue(51,session);
                b.setDateActual("2021/12/12");
                b.setRmks("remarksss");
                b.setFine(1000);
                b.save(session);
                
        //Book b=new Book(100, 2, "Advance C", "Lanka Publisher", "Pappu", "One");
        //out.println(b);
       // Book b1=new Book(1);
        //b1.setAuthor("Shivank");
        //b1.save();
        //Book.delete(9);
        //  out.println(b1);
               // boolean a=LoginManager.doLogin("Rajnish","Raj13",session,response);
                //System.out.println(a);
                //String h=session.getAttribute("usertype")+"";
                //System.out.println(h);
            }
            catch(Exception ex)
            {
                out.println(ex.getMessage());
            }
        %>
        <%@include file="footer.jsp" %>
    </body>
</html>
