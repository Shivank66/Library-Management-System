<%@page import="bookpackage.Member"%>
<%@page import="bookpackage.BookIssue"%>
<%@page import="loginpackage.LoginManager"%>
<%@page import="bookpackage.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
    </head>
    <body>
        <%
            String s ="";
            int memberno=0;
            try
            {
               // Member m = new Member(session,42);
               // s= m+"";
                int siteuserno=22;
         memberno=Member.getMembernoBySiteUserno(Integer.parseInt(siteuserno+""), session);
       System.out.println(memberno);
       
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
        <%=memberno%>
        <%@include file="footer.jsp" %>
    </body>
</html>
