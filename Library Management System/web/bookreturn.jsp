<%-- 
    Document   : bookreturn
    Created on : Nov 10, 2021, 11:36:46 AM
    Author     : maury
--%>
<%
     
        if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>


<%@page import="bookpackage.Book"%>
<%@page import="bookpackage.BookIssue"%>
<%@page import="loginpackage.LoginManager"%>
<%@page import="dbpackage.DbConfig"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>  
  
  
      
   


<%
            
 
    


            int Rid=0;
            int uid=0;
            int bid=0;
            int fine_per_day=2;
            String datei="";
            String datere="";
            String date1="";//new SimpleDateFormat("yyyy-mm-dd").parse(datei);
            String date2="";//new SimpleDateFormat("yyyy-mm-dd").parse(datere);
            String date4="";//new SimpleDateFormat("yyyy-mm-dd").parse(datere);
            String price="";
            String datera="";
            String remarks="";
            String disabler="";
            int fine=0;
            
            String alert = "";
            //String check=request.getParameter("check");
    
                    //Rid=request.getParameter("recno");
                   // uid =Integer.parseInt(request.getParameter("userId"));
                    //bid =Integer.parseInt(request.getParameter("bookId"));
                    //datei = request.getParameter("dateI");
                    //datere = request.getParameter("dateR");
                    //datera = request.getParameter("dateA");
                    //remarks = request.getParameter("rmks");
                    //fine = Integer.parseInt(request.getParameter("fin"));
                   
                   // Rid=b.getReceipt();
                   
    String check=request.getParameter("check");
    boolean isPostback = false;
    int key=0;
    if(check!=null)
        isPostback=true;
    if(!isPostback)
    {
    
    Rid= Integer.parseInt(""+request.getParameter("key"));
    
       // UserType usertype=new UserType(session ,typeno);
        
        //currtype=usertype.getUserTYPE();
    BookIssue b1=new BookIssue(Rid,session);
    uid=b1.getMemberno();
    bid=b1.getBookid();
    datei=b1.getDateIssue();
    datere=b1.getDateExpected();
    datera=b1.getDateActual();
    fine=BookIssue.fine(datere, datera, fine_per_day);
    Book book= new Book(bid,session);
    price =""+ book.getPrice();
    remarks=b1.getRmks();
    date1="value="+"\""+datei+"\"";
    date2="value="+"\""+datere+"\"";
    date4="value=   "+"\""+datera+"\"";

    }
    
    else
    {
     try{
      
      Rid=Integer.parseInt(request.getParameter("receipt")+"");
      fine=Integer.parseInt(request.getParameter("fine")+"");
      datera=request.getParameter("dateA")+"";
      datere=request.getParameter("dateR")+"";
      datei=request.getParameter("dateI")+"";
      bid=Integer.parseInt(request.getParameter("bookId")+"");
      price=request.getParameter("pri")+"";
      remarks=request.getParameter("rmks")+"";
      uid=Integer.parseInt(request.getParameter("userId")+"");
      BookIssue b2=new BookIssue(Rid,session);
      b2.setDateActual(datera);
      b2.setFine(fine);
      b2.setRmks(remarks);
      Book obj=new Book(bid,session);
      obj.setLocation(0);
      obj.save(session);
      b2.save(session);
        
    date1="value="+"\""+datei+"\"";
   date2="value="+"\""+datere+"\"";
   date4="value="+"\""+datera+"\"";
       
       disabler="disabled style=\"background-color:grey;\"";
        alert=validationspackage.AlertsAndMessages.showSuccess("Sucess!!", "Data inserted successfully");
     }
     catch(Exception ex){
         alert=validationspackage.AlertsAndMessages.showWarning("Warning!!","chal hatt");
                 
     }
        
    }
    
      
    
    



                
               
                
                    
                
            
            
        %>
<%@include file="header.jsp"%>
<script>
    function f()
{
var d1=document.getElementById("dateR");
var d2=document.getElementById("dateA");
var fine_per_day=<%=fine_per_day%>;
var date1=new Date(d1.value);
var date2=new Date(d2.value);
var f= document.getElementById("fine");
var diffTime = (date2 - date1);
if (diffTime <0)
    {
        f.value=0;
    }
else
    {
        
        
        var diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
        f.value=fine_per_day*diffDays;
    }

}
    
    
    </script>
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
   <input type ="hidden" name="check" id="check">
   <input type="hidden" name="receipt" id="receipt" value="<%=Rid%>">
	<div class="row">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Book Return Form</h1>
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
                        <input type="text" class="input form-control" name="userId" id="userId" value="<%=uid%>"  readonly>
			</div>
			
			
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Book ID<br>
                        <input type="text" class="input form-control" id="bookId" name="bookId" value="<%=bid%>"  readonly>
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
                        <input type="date" class="input form-control " name="dateI"   <%=date1%> id="dateI" readonly >
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Expected Date of Return<br>
                        <input type="date" name="dateR" class="input form-control "  <%=date2%>  id="dateR" readonly>
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
			Fine<br>
                        <input type="text" class="input form-control " name="fine"  value="<%=fine%>" id="fine" readonly>
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Actual Date of Return<br>
                        <input type="date" name="dateA" class="input form-control "  <%=date4%> id="dateA" onchange="f()"  >
			
                        </div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	
	
	<div class="row">
            <div class="col-md-2">
		</div>
		<div class="col-md-4">
                    <div class="form-group">
				Price<br>
                                <input type="text" class="input form-control" name="pri" id="pri" value="<%=price%>" readonly>
		
                    </div>
                </div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
				Remark<br>
                                <input type="text" class="input form-control" name="rmks" id="rmks" value="<%=remarks%>" placeholder="Enter Remark if Any">
			</div>
		</div>
		
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-5 form-group">
		
		</div>
		
                <div class="col-md-4 form-group">
			
			<input type="submit" class="button" name="cmd" value="     Return    " <%=disabler%> > 
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
