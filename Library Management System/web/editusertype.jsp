<%@page import="bookpackage.UserType"%>
<%@page import="dbpackage.DbConfig"%>
<%
    String key="";
    String link="";
    String disabler="";
    String disabledColor="";
    String result="";
    String alert="";
    String currtype="";
    String check=request.getParameter("check");
    boolean isPostback = false;
    if(check!=null)
        isPostback=true;
    if(!isPostback)
    {
    
    int typeno= Integer.parseInt(""+request.getParameter("key"));
    key="" + typeno;
        UserType usertype=new UserType(session ,typeno);
        
        currtype=usertype.getUserTYPE();
        
    
    }
    
    else
    {
     try{
        String newtype=request.getParameter("newtype");
        int typeno= Integer.parseInt(""+request.getParameter("key"));
        key="" + typeno;
          UserType usertype=new UserType(session ,typeno);
          currtype=usertype.getUserTYPE();
          usertype.setUserTYPE(newtype);
          usertype.save(session);
          alert=validationspackage.AlertsAndMessages.showSuccess("SUCCESS!!","Data Updated");
          disabler="disabled";
          link="<a style=\"color:white;\" href=\"http://localhost:777/Library_Management_System/usertypetable.jsp\">Click to go back";
          disabledColor="style=\"background-color:grey;\"";
     }
     catch(Exception ex){
         alert=validationspackage.AlertsAndMessages.showWarning("Warning!!","User Type Name already exist,You can not Update type name to already existing type name");
                 
     }
        
    }
    
      
    
    %>





<%@include file="header.jsp"%>
<%@page import="dbpackage.DbConfig"%>
        <title> EditUserType</title>
    </head>
 <body >

 <%@include file ="menu.jsp"%>
 <%=alert%>

<div class="container cont ">
    
<form action="editusertype.jsp" method="post">
    <input type="hidden" name="key" value="<%=key%>"/>
        
    
	<div class="row">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>User Type Update</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-6">
                   <div class="form-group">
			Current Usertype Name   <br>
                        <input type="text" readonly class="input form-control" value="<%=currtype%>" placeholder="Enter User Type" name="typename" id="typename" >
			</div>
		</div>
		<div class ="col-md-6">
		 	
			
			<div class="form-group">
			 New Usertype<br>
			<input type="text" class="input form-control " placeholder="Enter User Type" name="newtype" id="newtype" value="" >
			</div>
			
		</div>
		</div>
    <div class="row">
		<div class="col-md-5 form-group">
			
			
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit" <%=disabler%> <%=disabledColor%>  class="button" name="cmd" value="Update">
		</div>
        <div class="col-md-3">
         
		</div>
                </div>
          <div class="row">
		<div class="col-md-5 ">
			
			
		</div>
                <div class="col-md-4 ">
			 <%=link%>
			</div>
        <div class="col-md-3">
         
		</div>  
                        </div>
                
                
                
	</form>	
	</div>
  

	
	
	
                

  
 <%@include file="footer.jsp"%> 
   


 </body>   
</html>