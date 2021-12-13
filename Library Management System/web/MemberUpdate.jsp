<%@page import="bookpackage.BookIssue"%>
<%
     
        if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%@page import="bookpackage.UserType"%>
<%@page import="bookpackage.SiteUser"%>
<%@page import="bookpackage.Member"%>
<%
   
    String key="";
    String result="";
    //String drop="";
    String alert="";
    String nam1="",nam2="",mobile="",address="",dateR="",dateV="";
    int memberno=0;//,usertypeno=0;
    
    String curdate = BookIssue.getCurrentDate();
    
    String date1="";
    String regdateExp=BookIssue.getExpectedReturnDate(365);
    String date2="";
    String check=request.getParameter("check");
    boolean isPostback = false;
    if(check!=null)
        isPostback=true;
    //drop=UserType.dropdown(session);
    if(!isPostback)
    {
        key = request.getParameter("key");
        Member m =new Member(session,Integer.parseInt(key));
        memberno=Integer.parseInt(request.getParameter("key"));
        nam1= m.getFirstName();
        nam2=m.getLastName();
        mobile=m.getMobile();
        address=m.getAddress();
        dateR=m.getRegDate();
        dateV=m.getValidTillDate();
        date1="value=\""+dateR+"\"";
        date2="value=\""+dateV+"\"";
        
        
    }
    if(isPostback)
    {
        try{
     memberno=Integer.parseInt(request.getParameter("memberno"));
     nam1=request.getParameter("fName");
     nam2=request.getParameter("lName");
     mobile=request.getParameter("mob");
     address=request.getParameter("addr");
     dateR=request.getParameter("dateR");
    dateV=request.getParameter("dateV");
    date1="value=\""+dateR+"\"";
        date2="value=\""+dateV+"\"";
     Member m = new Member(session,memberno);
      m.setFirstName(nam1);
     m.setLastName(nam2);
     m.setMobile(mobile);
    m.setAddress(address);
    m.setRegDate(dateR);
     m.setValidTillDate(dateV);
     m.save(session);
     //username=request.getParameter("uName");
     //password=request.getParameter("pass");
     //usertypeno=Integer.parseInt(""+request.getParameter("userTypeno"));
   // SiteUser s=new SiteUser(username,password,usertypeno,"Active");
    // s.save(session);
     //userno=s.getUserno();
    // Member m=new Member(usertypeno,nam1,nam2,address,mobile,dateR,dateE,userno);
    // m.save(session);
    
      alert=validationspackage.AlertsAndMessages.showSuccess("SUCCESS!!","Data Updated");
        }
         catch(Exception ex){
             System.err.println(ex);
          if(check==""){
                alert="";
            }
            else{
               alert=validationspackage.AlertsAndMessages.showWarning("WARNING!!",ex+""); 
            }
         }
        
    
    }
    
    
      
    
    %>

<%@include file="header.jsp"%>
<title>Member Update</title>
<style>
    .bg-light {
  background: #eef0f4;
}

.choices__list--dropdown .choices__item--selectable {
  padding-right: 1rem;
}

.choices__list--single {
  padding: 0;
}

.card {
  transform: translateY(-50%);
}

.choices[data-type*=select-one]:after {
  right: 1.5rem;
}

.shadow {
  box-shadow: 0.3rem 0.3rem 1rem rgba(178, 200, 244, 0.23);
}

a {
  text-decoration: none;
  color: inherit;
  transition: all 0.3s;
}
    
</style>
    
</head>
<body class="container-fluid">
     <%@include file='menu.jsp'%>
<!--!-->
<form action="MemberUpdate.jsp" method="post">
    <div class="col-sm-12">
            <%=alert%>
        </div>
<div class="container cont ">
        <div class="row">
            <input
                type="hidden" name="check" id="check">
             <input
                 type="hidden" name="key" id="key" value="<%=key%>">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Member Update   </h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
    
	<div class="row">
            
		<div class="col-md-2">
		
		</div>
		<div class=" col-md-8 form-group">
			Member no<br>
                        <input type="text" class="input form-control " placeholder="" value="<%=memberno%>" id="memberno" name="memberno" readonly>
			</div>
		<div class="col-md-2">	
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4">
			
			
			<div class="form-group">
			First Name<br>
                        <input type="text" class="input form-control " placeholder="First Name" id="fName" name="fName" value="<%=nam1%>" >
			</div>
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Last Name<br>
			<input type="text" class="input form-control" id="lName" value="<%=nam2%>" name="lName" placeholder="Last Name">
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
                                <input type="text" class="input form-control" id="mob" value="<%=mobile%>" name="mob" placeholder="Mobile no">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Address<br>
                        <input type="text" class="input form-control " id="addr" value="<%=address%>" name="addr" placeholder="Address" >
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
                        <input type="date" class="input form-control " id="dateR" name="dateR" <%=date1%> placeholder="Registration Date">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Registration Expiry Date<br>
                        <input type="date" class="input form-control " id="dateV" name="dateV" <%=date2%>>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
<div class="row">
		<div class="col-md-2 form-group">
		
		</div>
		<div class="col-md-3 form-group">
			
			
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit" class="button" name="cmd" value="Update">
		</div>
		<div class="col-md-2">	
		
		</div>
	</div>	
	
	
        
	

	
	
</div>
    
</form>
<%@include file="footer.jsp"%>
</body>
</html>
