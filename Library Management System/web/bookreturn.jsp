<%@page import="loginpackage.LoginManager"%>
<%@page import="bookpackage.Book"%>
<%@page import="bookpackage.BookIssue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbpackage.DbConfig"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>  
<%
            String table=dbpackage.DbConfig.getTable("select * from bookissue where actualreturndate is null",session);
%>
<%@include file="header.jsp"%>
</head>
<body class="container-fluid">
<%@include file="menu.jsp"%>
<div class="container-fluid">
    <form action="bookreturn.jsp" method="post">
    <div class='row'>
        <div class="col-sm-12">
            
        </div>
    </div>

<div class="row">
<div class="container cont ">
   <input type ="hidden" name="check">
	<div class="row">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Book Return</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	<div class="row">
            <div class="col-md-1">
		</div>
		<div class="col-md-7 form-group">
			<div class="form-group">
			Book ID<br>
                        <input type="text" class="input form-control " placeholder="Book ID" id="bid" name="bid" value="">
			</div>
		</div>
                <div class="col-md-1 form-group">
			
                    <input type="submit" class="button" style="margin-top: 20px; padding: 4px; font-size: 20px; box-shadow: 0 4px #AC7D0C;" name="cmd" value="  Search  ">
		</div>
		<div class="col-md-2">	
		
		</div>
        </div>
	 
	
	
	
	
	
	
	
	
	
       

	
	
    
	
</div>
</div>
</form>


</div>
<div class="row">
           <div class="col-sm-1"></div>
          <div class="col-sm-10"><%=table%></div>
         
      </div>
<%@include file="footer.jsp"%>
</body>
</html>
