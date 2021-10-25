<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbpackage.DbConfig"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.util.Date"%>



        <%
            
            
            String Rid="";
            String uid="";
            String bid="";
            String datei="";
            String datere="";
            String datera="";
            String remarks="";
            String fine="";
            
                try
                {
                    Rid=request.getParameter("recno");
                    uid =request.getParameter("userId");
                    bid =request.getParameter("bookId");
                    datei = request.getParameter("dateI");
                    datere = request.getParameter("dateR");
                    datera = request.getParameter("dateA");
                    remarks = request.getParameter("rmks");
                    fine = request.getParameter("fin");
                    Connection connection =DbConfig.getConnection(session);
                    PreparedStatement statement = connection.prepareStatement("insert into BookIssue values(?,?,?,to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),to_date(?,'yyyy-mm-dd'),?,?)");
                    
                    statement.setString(1,Rid);
                    statement.setString(2, uid);
                    statement.setString(3, bid);
                    statement.setString(4, datei);
                    statement.setString(5, datere);
                    statement.setString(6, datera);
                    statement.setString(7, remarks);
                    statement.setString(8, fine);
                    
                    int n = statement.executeUpdate();
                    
                }
                
                catch(Exception ex)
                {
                    System.out.println(ex);
                    
                }
               System.out.println(uid+"***********");     
                    
                    
                
            
            
        %>
<%@include file="header.jsp"%>
</head>
<body >
<%@include file="menu.jsp"%>
<div class="container-fluid">
<form action="book.jsp" method="post">
<div class="row">
<div class="container cont ">
   
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
			Receipt Id.<br>
                        <input type="text" class="input form-control" name="recno" id="recno"  placeholder="Enter receipt Id">
			</div>
			
			
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			User Id.<br>
                        <input type="text" class="input form-control" id="userId" name="userId"  placeholder="Enter User Id">
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
			Book Id.<br>
			<input type="text" class="input form-control " name="bookId"  id="bookId" placeholder="Enter Book Id">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Date of Issue<br>
			<input type="date" name="dateI" class="input form-control " name="dateI" value="" id="dateI" placeholder="Enter Date of Issue" >
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
			Expected Date of Return<br>
			<input type="date" value="" class="input form-control " name="dateR" id="dateR" placeholder="Enter Expected Date of Return">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Actual Date of Return<br>
			<input type="date" value="" class="input form-control "name="dateA" id="dateA" >
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
				Remark<br>
                                <input type="text" class="input form-control" name="rmks" id="rmks" placeholder="Enter Remark if Any">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
                        
			Fine<br>
                        <input type="number" class="input form-control" id="fin" name="fin" placeholder="Enter Fine">
                        
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4 form-group">
		
		</div>
		<div class="col-md-2 form-group">
			
			<input type="submit" class="button" name="cmd" value="Search">
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit" class="button" name="cmd" value="Issue">
		</div>
		<div class="col-md-2">	
		
		</div>
	</div>
        <div class="row">
            <input type ="hidden" name="check">
        </div>
	

	
	
    
	
</div>
</div>
</form>
<%@include file="footer.jsp"%>

</div>
</body>
</html>