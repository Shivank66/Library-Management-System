

<%@include file="header.jsp"%>
</head>
<body >
<%@include file="menu.jsp"%>
<form action="test.jsp" method="post">
<div class="container cont ">
    
	<div class="row">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Member Registration </h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4">
			
			
			<div class="form-group">
			First Name<br>
			<input type="text" class="input form-control " placeholder="First Name" id="fName" >
			</div>
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Last Name<br>
			<input type="text" class="input form-control" id="lName" placeholder="Last Name">
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
				Mobile<br>
                                <input type="text" class="input form-control" id="mob" placeholder="Mobile no">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Address<br>
			<input type="text" class="input form-control " id="addr" placeholder="Address" >
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
			Registration Date<br>
			<input type="date" class="input form-control " id="dateR" placeholder="Registration Date">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Registration Expiry Date<br>
			<input type="date" class="input form-control " id="dateV" >
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
			User Type no.<br>
			<input type="text" class="input form-control "  id="userTypeno" placeholder="UserTypeno">
			</div>
		</div>
		<div class ="col-md-2 form-group">
			
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
			
			<input type="submit" class="button" name="cmd" value="Register">
		</div>
		<div class="col-md-2">	
		
		</div>
	</div>
	

	
	
</div>
    
</form>
<%@include file="footer.jsp"%>
</body>
</html>
