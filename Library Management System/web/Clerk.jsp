<%@page import="bookpackage.BookIssue"%>
<%@page import="bookpackage.Clerk"%>
<%@page import="loginpackage.LoginManager"%>

<%@page import="bookpackage.UserType"%>
<%@page import="bookpackage.SiteUser"%>
<%@page import="bookpackage.Member"%>
<%
    int clerkno=0;
    String result="";
    String drop="";
    String alert="";
    String nam1="",nam2="",mobile="",address="",dateR="",dateE="",username="",password="";
    int userno=0,usertypeno=0;
    String curdate = BookIssue.getCurrentDate();
    String date1="value=\""+curdate+"\"";
    
    String check=request.getParameter("check");
    boolean isPostback = false;
    if(check!=null)
        isPostback=true;
    drop=UserType.dropdownClerk(session);
    if(isPostback)
    {
        try{
     nam1=request.getParameter("fName");
     nam2=request.getParameter("lName");
     mobile=request.getParameter("mob");
     address=request.getParameter("addr");
     dateR=request.getParameter("dateR");
     //dateE=request.getParameter("dateV");
     username=request.getParameter("uName");
     password=request.getParameter("pass");
     usertypeno=Integer.parseInt(""+request.getParameter("userTypeno"));
    SiteUser s=new SiteUser(username,password,usertypeno,"Active");
     s.save(session);
     userno=s.getUserno();
    
     Clerk m=new Clerk(userno,nam1,nam2,address,mobile,dateR,usertypeno);
     m.save(session);
     clerkno=m.getClerkno();
     
    
      alert=validationspackage.AlertsAndMessages.showSuccess("SUCCESS!!","Alloted Clerk Id <b>"+clerkno+"</b>");
        }
         catch(Exception ex){
             System.err.println(ex);
          if(check==""){
                alert="";
            }
            else{
               alert=validationspackage.AlertsAndMessages.showWarning("WARNING!!","Usertype Name already exist"); 
            }
         }
        
    
    }
    
    
      
    
    %>

<%@include file="header.jsp"%>
<title>Register Clerk </title>
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
<script>
    const sorting = document.querySelector('.selectpicker');
const commentSorting = document.querySelector('.selectpicker');
const sortingchoices = new Choices(sorting, {
    placeholder: false,
    itemSelectText: ''
});


// Trick to apply your custom classes to generated dropdown menu
let sortingClass = sorting.getAttribute('class');
window.onload= function () {
    sorting.parentElement.setAttribute('class', sortingClass);
}
    </script>
</head>
<body class="container-fluid">
     <%@include file='menu.jsp'%>
<!--!-->
<form action="Clerk.jsp" method="post">
    <div class="col-sm-12">
            <%=alert%>
        </div>
<div class="container cont ">
    
	<div class="row">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Clerk Registration </h1>
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
			<input type="text" class="input form-control " placeholder="First Name" id="fName" name="fName" >
			</div>
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Last Name<br>
			<input type="text" class="input form-control" id="lName" name="lName" placeholder="Last Name">
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
                                <input type="text" class="input form-control" id="mob" name="mob" placeholder="Mobile no">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Address<br>
			<input type="text" class="input form-control " id="addr" name="addr" placeholder="Address" >
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
                        <input type="date" class="input form-control " id="dateR" <%=date1%> name="dateR" placeholder="Registration Date">
			</div>
		</div>
		
			<div class ="col-md-4 form-group">
                    Usertype<br>
	
                        <%=drop%>
                        </div>
		
		<div class="col-md-2">
		</div>
	</div>
	
	
	
        <div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			User Name<br>
			<input type="text" class="input form-control " id="uName" name="uName" placeholder="User Name">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Password<br>
                        <input type="text" class="input form-control " id="pass" name="pass" placeholder="Password" >
			</div>
		</div>
                    <div class="col-md-2">
		</div>
	</div>
	
    
	<div class="row">
		<div class="col-md-4 form-group">
		
		</div>
		<div class="col-md-2 form-group">
			
			
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
