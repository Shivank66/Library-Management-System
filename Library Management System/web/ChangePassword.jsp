<%@page import="bookpackage.SiteUser"%>
<%@page import="bookpackage.UserType"%>
<%@page import="dbpackage.DbConfig"%>
<%
    String key="";
    String link="";
    String disabler="";
    String disabledColor="";
    String result="";
    String alert="";
    String oldpassword="";
    String currtype="";
    String check=request.getParameter("check");
    
    boolean isPostback = false;
    if(check!=null)
        isPostback=true;
    if(isPostback)
    {
   try{
        String typename=request.getParameter("typename");
        String newtype=request.getParameter("newtype");
        
        SiteUser s=new SiteUser(Integer.parseInt(LoginManager.getCurrentSiteUserno(session)),session);
        oldpassword=s.getPassword();
        if( oldpassword.equals(typename))
        {
        SiteUser.ChangePassword(session,newtype);
          alert=validationspackage.AlertsAndMessages.showSuccess("SUCCESS!!","Password Updated");
          disabler="disabled";
          link="<a style=\"color:white;\" href=\"http://localhost:777/Library_Management_System/usertypetable.jsp\">Click to go back";
          disabledColor="style=\"background-color:grey;\"";
        }
        else
        {
        alert=validationspackage.AlertsAndMessages.showWarning("Warning!!","Old Password is wrong");
        }
     }
     catch(Exception ex){
         alert=validationspackage.AlertsAndMessages.showWarning("Warning!!","User Type Name already exist,You can not Update type name to already existing type name");
                 
     }
        
    }
    
      
    
    %>





<%@include file="header.jsp"%>
<%@page import="dbpackage.DbConfig"%>
        <title> Change Password</title>
    </head>
 

 <%@include file ="menu.jsp"%>
 <body class="container-fluid">
 <%=alert%>

<div class="container cont ">
    
<form action="ChangePassword.jsp" method="post">
    
        
    
	<div class="row">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Password Change</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
                <div class="col-md-2"></div>
		<div class="col-md-4">
                   <div class="form-group">
			Current Password  <br>
                        <input type="text"  class="input form-control" value="" placeholder="Enter User Type" name="typename" id="typename" >
			</div>
		</div>
		<div class ="col-md-4">
		 	
			
			<div class="form-group">
			 New Password<br>
			<input type="text" class="input form-control " placeholder="Enter User Type" name="newtype" id="newtype" value="" >
			</div>
			
		</div>
                 <div class="col-md-2"></div>
		</div>
    <div class="row">
		<div class="col-md-5 form-group">
			
			
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit" <%=disabler%> <%=disabledColor%>  class="button" name="cmd" value="Submit">
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