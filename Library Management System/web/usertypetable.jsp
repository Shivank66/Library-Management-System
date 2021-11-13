<%
     
     if(!(LoginManager.protectPageAdmin(response,session)))
       return;
%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
            String table=dbpackage.DbConfig.getTable("select * from usertypes","Action","Edit","editusertype.jsp",session);
      %>



<%@include file="header.jsp"%>  

        <title> Page</title>
    </head>
    <body class="container-fluid">
    
    <div class="row">
    <div class="col-sm-12">
    <%@include file="menu.jsp"%>
    </div>
    </div>
        
      
      <div class ="row">
          <div class=   "col-sm-4"></div>
          <div class="col-sm-4"><h1>USER TYPE TABLE </h1></div>
          <div class="col-sm-4"></div>
      </div>
      <div class="row">
          <div class="col-sm-4"></div>
          <div class="col-sm-4 container-fluid"><div class=""><%=table%></div></div>
          <div class="col-sm-4"></div>
      </div> 
          
      <%@include file="footer.jsp"%>
      
     
    </body>
</html>
