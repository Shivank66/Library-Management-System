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
                    Connection connection =DbConfig.getConnection();
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
<!DOCTYPE html>
<html>
<head>
<title>Book Issue Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.cont
{
margin-top:20px;
background-color:teal;
padding-bottom:100px;
color:white;
box-shadow:0px 0px 20px black;
border-radius:20px;
}

/*.input{
1width:300px;
border-style:solid;
border-radius:10px;
}*/
body{
background-color:#022140 ;

}
.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #AC7D0C;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

</style>
</head>
<body >
<form action="book.jsp" method="post">
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
</form>
</body>
</html>