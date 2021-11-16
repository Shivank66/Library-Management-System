<%
    if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%@page import="bookpackage.Payment"%>
<%@page import="bookpackage.BookIssue"%>
<%@page import="bookpackage.Member"%>
<%
    String alert="";
    int memberno=0;
    String name="";
    int tfine=0;
    //int payed=0;
    int pay=0;
    String check=request.getParameter("check");
    
    String key="";
    
    boolean isPostback=false;
    if (check != null)
    {
        isPostback=true;
    }
    if(!isPostback)
    {
    key=request.getParameter("key");
     memberno=Integer.parseInt(key);
                Member m= new Member(session,memberno);
                name= m.getFirstName()+" "+ m.getLastName();
                tfine=Payment.totalFineByMemberno(memberno, session) - Payment.totalPaymentByMemberno(memberno, session);
    }
    
    
    
    
    if(isPostback)
    {
        try
        { 
           
            
            
                //key=request.getParameter("key");
                memberno=Integer.parseInt(request.getParameter("key"));
                name=request.getParameter("name");
                
                pay=Integer.parseInt(request.getParameter("paym"));
                Payment.pay(memberno, pay, session);
                tfine=Payment.totalFineByMemberno(memberno, session)- Payment.totalPaymentByMemberno(memberno, session);
                alert=validationspackage.AlertsAndMessages.showSuccess(" Sucess!!", "Payment Successful");
            
            
            
        }
        catch(Exception ex)
        {
           alert=validationspackage.AlertsAndMessages.showWarning("Warning!!", "something went wrong");
        }
    }

%>

<%@include file="header.jsp"%>
<%@page import="dbpackage.DbConfig"%>

        <title> Payment</title>
    </head>
 <body>

 <%@include file ="menu.jsp"%>

<%=alert%>
<div class="container cont ">
    
<form action="payment.jsp" method="post">
    <input type="hidden" id="key" name="key" value="<%=key%>">
   
        
    
	<div class="row">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-4">
		
		</div>
		<div class="col-md-5 " style="padding-left:80px">
			<h1>Payments</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
            <div class="col-md-2"></div>
		<div class="col-md-8">
                   <div class="form-group">
			Member No  <br>
                        <input type="text" readonly  class="input form-control" value="<%=memberno%>" placeholder="Enter Memberno" name="memberid" id="memberid"  >
			</div>
		</div>
		<div class ="col-md-1">
		 	
			
			
			
		</div>
		</div>
    <div class="row">
            <div class="col-md-2"></div>
		<div class ="col-md-8">
		 	
			
			<div class="form-group">
			Name<br>
                        <input type="text" class="input form-control " placeholder="Name" name="name" id="name" value="<%=name%>" readonly  >
			</div>
			
		</div>
		
		</div>
    <div class="row">
            <div class="col-md-2"></div>
		<div class ="col-md-4">
		 	
			
			<div class="form-group">
			 Fine to Pay (in Rs.)<br>
                         <input type="text" class="input form-control " placeholder="Fine to pay" name="tfine" id="tfine" value="<%=tfine%>" readonly  >
			</div>
			
		</div>
		<div class ="col-md-4">
		 	
			
			<div class="form-group">
			 Amount payed (in Rs.) <br>
                         <input type="text" class="input form-control " placeholder="Enter Amount payed" name="paym" id="paym" value="" >
			</div>
			
		</div>
		</div>
    <div class="row">
		<div class="col-md-5 form-group">
			
			
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit"   class="button" id="cmd1" name="cmd" value="Pay">
		</div>
        <div class="col-md-3">
         
		</div>
                </div>
          <div class="row">
		<div class="col-md-5 ">
			
	
		</div>
                <div class="col-md-4 ">
			 
			</div>
        <div class="col-md-3">
         
		</div>  
                        </div>
                
                
                
	</form>	
	</div>
  

	
	
	
                

  
 <%@include file="footer.jsp"%> 
   


 </body>   
</html>