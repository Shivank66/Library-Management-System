<%-- 
    Document   : bookreturn.jsp
    Created on : Oct 29, 2021, 5:57:19 PM
    Author     : maury
--%>
<%@page import="bookpackage.BookIssue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbpackage.DbConfig"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>  

<%@include file="header.jsp"%>
</head>
<body class="container-fluid">
<%@include file="menu.jsp"%>
<div class="container-fluid">
    <form action="bookreturn.jsp" method="post">
    <div class='row'>
        <div class="col-sm-12">
            <%=alert%>
        </div>
    </div>

<div class="row">
<div class="container cont ">
   <input type ="hidden" name="check">
	<div class="row">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Book Issue Form</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4">
                    <div class="form-group">
			User ID <br>
                        <input type="text" class="input form-control" name="userId" id="userId"  placeholder="Enter User Id">
			</div>
			
			
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Book ID<br>
                        <input type="text" class="input form-control" id="bookId" name="bookId"  placeholder="Enter Book Id">
			</div>
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Date of Issue<br>
                        <input type="date" class="input form-control " name="dateI"   <%=date1%> id="dateI" placeholder="Enter Date Of Issue" >
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Expected Date of Return<br>
                        <input type="date" name="dateR" class="input form-control "  <%=date2%> id="dateR" placeholder="Enter Expected Return date" >
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	
	
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
				Remark<br>
                                <input type="text" class="input form-control" name="rmks" id="rmks" placeholder="Enter Remark if Any">
			</div>
		</div>
		
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-5 form-group">
		
		</div>
		
                <div class="col-md-4 form-group">
			
			<input type="submit" class="button" name="cmd" value="     Issue    ">
		</div>
		<div class="">	
		
		</div>
	</div>
        <div class="row">
            
        </div>
	

	
	
    
	
</div>
</div>
</form>
<%@include file="footer.jsp"%>

</div>
</body>
</html>
