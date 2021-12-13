<%@page import="loginpackage.LoginManager"%>
<%
    if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%
            String table=dbpackage.DbConfig.getTable("select memberno, concat(concat(firstname ,' '),lastname) as name, address, regdate as Registration_Date, Validtilldate, mobile, siteuserno from members","Action","Edit","MemberUpdate.jsp",session);
      %>

<%@page import="bookpackage.Payment"%>
<%@page import="bookpackage.BookIssue"%>
<%@page import="bookpackage.Member"%>


<%@include file="header.jsp"%>
<title>Member List</title>
<%@page import="dbpackage.DbConfig"%>

        <title> Member list</title>
        
    </head>
 <body class="container-fluid">

 <%@include file ="menu.jsp"%>


<div class="container cont ">
    
<form action="booktable.jsp" method="post">
   
        
    
	<div class="row">
          		<div class="col-md-4">
		
		</div>
		<div class="col-md-5 " style="padding-left:80px">
			<h1>Member List</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	
    
    
		<div class="row">
            <div class="col-md-2">
		</div>
		<div class="col-md-8 form-group">
			<div class="form-group">
			Search<br>
                        <input type="text" class="input form-control " placeholder="Enter Anything to Search" id="bid" name="bid" onkeyup="Search('bid','tableid','countid')" value="">
			</div>
		</div>
                    <div class="col-md-2">
		</div>
                
		
		</div>
               
       
                
          
                      
                
                
                
	</form>	
	</div>
     <div class="row">
         <div class ="col-md-1">
             
         </div>
         <div class="col-md-10 ">
			<%=table%>
			
		</div>
               
       
                </div>                   
  

	
	
	
                

  
 <%@include file="footer.jsp"%> 
   


 </body>   
</html>