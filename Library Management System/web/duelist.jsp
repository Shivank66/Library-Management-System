<%@page import="loginpackage.LoginManager"%>
<%
    if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%
            String table=dbpackage.DbConfig.getTable("select shiv.memberno, abhi.Firstname ||' '||abhi.lastname as Name,abhi.mobile, shiv.due  from (select s.memberno,s.total-f.amount as due from (select memberno,sum(amount) as amount from payments group by memberno) f join"
+" (select memberno,sum(fine+extrafine) as total from (select b.userid as Memberno, m.firstname ||' '|| m.lastname as name,b.fine,b.extrafine from bookissue b join members m on b.userid = m.memberno ) group by memberno) s on f.memberno=s.memberno) shiv join members abhi on abhi.memberno=shiv.memberno","Action","Pay","payment.jsp",session);
      %>

<%@page import="bookpackage.Payment"%>
<%@page import="bookpackage.BookIssue"%>
<%@page import="bookpackage.Member"%>
<%
    
    
    String alert="";
    int memberno=0;
    //int payments=0;
    int rfine=Payment.totalPayments(session);
    
    String name="";
    int tfine=Payment.totalFine(session);
    int duefine=tfine-rfine;
    int payments=0;
    //int payed=0;
    int pay=0;
    
%>

<%@include file="header.jsp"%>
<%@page import="dbpackage.DbConfig"%>

        <title> Payment</title>
        
    </head>
 <body class="container-fluid">

 <%@include file ="menu.jsp"%>

<%=alert%>
<div class="container cont ">
    
<form action="duelist.jsp" method="post">
   
        
    
	<div class="row">
          		<div class="col-md-4">
		
		</div>
		<div class="col-md-5 " style="padding-left:80px">
			<h1>Due List</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	
    
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
			 Total Fine <br>
                         <input type="text" class="input form-control " placeholder="Total Fine" name="tfine" id="tfine" value="<%=tfine%>" readonly>
			</div>
        </div>
		<div class ="col-md-4">
		 	
			
			<div class="form-group">
			Amount Collected<br>
                         <input type="text" style="color: green" class="input form-control " placeholder="Amount Collected" name="rfine" id="rfine" value="<%=rfine%>" readonly  >
			</div>
			
		</div>
		<div class ="col-md-4">
		 	
			<div class="form-group">
			Remaining Fine<br>
                        <input type="text" class="input form-control " style="color: red" placeholder="Remainig Fine" name="duefine" id="duefine" value="<%=duefine%>" readonly  >
			</div>
			
			
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
         <div class ="col-md-4">
             
         </div>
         <div class="col-md-8 form-group">
			<%=table%>
			
		</div>
               
       
                </div>                   
  

	
	
	
                

  
 <%@include file="footer.jsp"%> 
   


 </body>   
</html>