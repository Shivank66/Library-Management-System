

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>




<%@include file="header.jsp"%>

        <title> Page</title>
    </head>
    <body>
    <div class="container-fluid">
    <div class="row">
    <div class="col-sm-12">
    <%@include file="menu.jsp"%>
    </div>
    </div>
        
      <%
            String table=dbpackage.DbConfig.getTable("select * from usertypes",session);
      %>
      <div class ="row">
          <div class="col-sm-4"></div>
          <div class="col-sm-4"><h1>USER TYPE TABLE </h1></div>
          <div class="col-sm-4"></div>
      </div>
      <div class="row">
          <div class="col-sm-4"></div>
          <div class="col-sm-4"><%=table%></div>
          <div class="col-sm-4"></div>
      </div> 
      <%@include file="footer.jsp"%>
      </div>
    </body>
</html>
