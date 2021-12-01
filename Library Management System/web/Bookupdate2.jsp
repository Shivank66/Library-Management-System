<%@page import="loginpackage.LoginManager"%>
<%
     
        if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%@page import="bookpackage.Book"%>
<%
    String key="";
    int bookid=-1; 
    String bookName="";
    String  publisher="";
    String author="";
    String edition="";
    int price=0;
    int location;
    String check;
    String alert="";
    String cmd="";
    check=request.getParameter("check");
    
    boolean isPostback=false;
    if (check!=null){
        isPostback=true;
    }
    if(!isPostback)
    {
    key=request.getParameter("key");
    bookid=Integer.parseInt(key);
     Book b = new Book(bookid, session);
     author=b.getAuthor();
            publisher=b.getPublisher();
            edition=b.getEdition();
            price=b.getPrice();
            bookName=b.getBookname();
           
    
    }
    
    
           // bookid=Integer.parseInt(key);
                     
//author=request.getParameter("Aut");
            //publisher=request.getParameter("pub");
         if(isPostback)
         {//edition=request.getParameter("Edi");
            //location=Integer.parseInt(request.getParameter("Loc"));
              key=request.getParameter("key");
             bookid=Integer.parseInt(key);
            Book b = new Book(bookid, session);
             //price=Integer.parseInt(request.getParameter("Pri"));
        try{   
            
            cmd=request.getParameter("cmd")+"";
      
        if(cmd.equals(" Update "))
        {
        author=request.getParameter("Aut"); 
        publisher=request.getParameter("pub");
        edition=request.getParameter("Edi");
        bookName=request.getParameter("bName");
        //locat edition=request.getParameter("Edi");ion=Integer.parseInt(request.getParameter("Loc"));
        price=Integer.parseInt(request.getParameter("Pri"));    
        b.setAuthor(author);
        b.setBookname(bookName);
        b.setEdition(edition);
        b.setPublisher(publisher);
        b.setPrice(price);
        b.save(session);
        alert=validationspackage.AlertsAndMessages.showSuccess("Success!!", "Data inserted ");
        
        
        }
        if(cmd.equals("  Clear  "))
        {
        author="";
            publisher="";
            edition="";
            price=0;
            bookName="";
            bookid=0;
            alert=validationspackage.AlertsAndMessages.showSuccess("Cleared!!", "Data cleared from form..... ");
       
        }
            
            
           // bookid=b.getBookid();
           
           //author=request.getParameter("Aut");
            //publisher=request.getParameter("pub");
            //edition=request.getParameter("Edi");
            //location=Integer.parseInt(request.getParameter("Loc"));
            //price=Integer.parseInt(request.getParameter("Pri"));
        }    
        catch (Exception ex)
        {
            alert=validationspackage.AlertsAndMessages.showWarning("Warning!!", ex+"");
        }
         }
    


%>
<%@include file="header.jsp"%>


</head>
<body class="container-fluid">
<%@include file="menu.jsp"%>
<form action="Bookupdate2.jsp" method="post">
<div class='row'>
    <div class='col-sm-12'><%=alert%></div>
</div>
<div class="container cont ">
    <div class="col-sm-12">
      </div>
	<div class="row">
            <input type="hidden" name="key" id="key" value="<%=key%>">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-4">
		
		</div>
		<div class="col-md-4" style="padding-left:80px">
			<h1>Book Update</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	<div class="row">
            <div class="col-md-2">
		</div>
		<div class="col-md-7 form-group">
			<div class="form-group">
			Book ID<br>
                        <input type="text"  class="input form-control " placeholder="Book ID" id="bid" name="bid" value="<%=key%>">
			</div>
		</div>
                <div class="col-md-1 form-group">
			
                   </div>
		<div class="col-md-2">	
		
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4">
			
			<div class="form-group">
			Book Name<br>
                        <input type="text" class="input form-control " placeholder="Book Name" id="bName" name="bName" value="<%=bookName%>" >
			</div>
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Publisher<br>
                        <input type="text" class="input form-control" id="pub" name="pub" placeholder="Publisher" value="<%=publisher%>">
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
				Author<br>
                                <input type="text" class="input form-control" id="Aut" name="Aut" placeholder="Author" value="<%=author%>">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Price<br>
                        <input type="text" class="input form-control " id="Pri" name="Pri" placeholder="Price" value="<%=price%>" >
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
			Edition<br>
                        <input type="text" class="input form-control " id="Edi" name="Edi" placeholder="Edition" value="<%=edition%>">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	
	
		
    
	<div class="row">
		<div class="col-md-4 form-group">
			
		</div>
                <div class="col-md-1 form-group">
			
			<input type="submit" class="button" name="cmd" id="cmd" value=" Update ">
		</div>
            <div class="col-md-1">	
		
		</div>
            <div class="col-md-1 form-group">
			
                <input type="submit" class="button" style="margin-left: 22px;" name="cmd" id="cmd" value="  Clear  ">
		</div>
		<div class="col-md-4">	
		
		</div>
	</div>
	

	
	
</div>
    
</form>
<%@include file="footer.jsp"%>
</body>
</html>
