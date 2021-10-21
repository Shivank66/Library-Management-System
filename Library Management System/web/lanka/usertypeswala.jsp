<%-- 
    Document   : usertypeswala
    Created on : Oct 20, 2021, 1:55:33 PM
    Author     : maury
--%>
<%@page import="dbpackage.DbConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bookpackage.UserType" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String typename="";
    int alloted=0;
    String result="";
    String check=request.getParameter("check");
    boolean isEmpty = true;
    if(check!=null)
        isEmpty=false;
    if(!isEmpty)
    {

    
     try{
    typename=request.getParameter("typename");
    if(typename!="")
    { UserType u=new UserType(typename);
        //u.setUserTYPE("Student2");
        u.save(session);
        alloted=u.getNewId(session);
        
        result=typename+" got "+alloted+" User Type No.";
     }
     else
        result="Null chori sadda hogaya ";}
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    
    
    %>

        
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Type Entry</title>
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
background-color:#022140 ;    }
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
<form action="usertypeswala.jsp" method="post">
<div class="container cont ">
	<div class="row">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>User Type Entry</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-4">
		</div>
		<div class ="col-md-4">
			
			
			<div class="form-group">
			Usertype<br>
			<input type="text" class="input form-control " placeholder="Enter User Type" name="typename" id="typename" >
			</div>
			
		</div>
		</div>
    <div class="row">
		<div class="col-md-5 form-group">
			
			
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit" class="button" name="cmd" value="Submit">
		</div>
        <div class="col-md-3">
            <%=result%>
		</div>
		
	</div>
	

	
	
	
	
</div>
</form>
    </body>
</html>
