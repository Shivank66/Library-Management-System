<%@page import="loginpackage.LoginManager"%>
<%
     
        if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%@page import="bookpackage.Book"%>
<%
    int bookid=0; 
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
    if(isPostback)
    {
        try {
            bookid=Integer.parseInt(request.getParameter("bid"));
                     
//author=request.getParameter("Aut");
            //publisher=request.getParameter("pub");
            //edition=request.getParameter("Edi");
            //location=Integer.parseInt(request.getParameter("Loc"));
            //price=Integer.parseInt(request.getParameter("Pri"));
            Book b = new Book(bookid, session);
            
            cmd=request.getParameter("cmd")+"";
        if(cmd.equals("  Search  "))
        {   
            author=b.getAuthor();
            publisher=b.getPublisher();
            edition=b.getEdition();
            price=b.getPrice();
            bookName=b.getBookname();
            bookid=b.getBookid();
        }
        if(cmd.equals(" Delete "))
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
        //b.save(session);
        b.delete(session);
        alert=validationspackage.AlertsAndMessages.showWarning("Success!!", "Book Deleted");
        
        
        }
        if(cmd.equals("  Clear  "))
        {
         bookid=0;
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
<form action="Bookdelete.jsp" method="post">
<div class='row'>
    <div class='col-sm-12'><%=alert%></div>
</div>
<div class="container cont ">
    <div class="col-sm-12">
      </div>
	<div class="row">
            <input
                type="hidden" name="check" id="check">
		<div class="col-md-4">
		
		</div>
		<div class="col-md-4" style="padding-left:80px">
			<h1>Book Delete</h1>
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
                        <input type="text" class="input form-control " placeholder="Book ID" id="bid" name="bid" value="<%=bookid%>">
			</div>
		</div>
                <div class="col-md-1 form-group">
			
                    <input type="submit" class="button" style="margin-top: 20px; padding: 4px; font-size: 20px; box-shadow: 0 4px #AC7D0C;" name="cmd" value="  Search  ">
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
			
			<input type="submit" class="button" name="cmd" id="cmd" value=" Delete ">
		</div>
            <div class="col-md-1">	
		
		</div>
            <div class="col-md-1 form-group">
			
                <input type="submit" class="button" style="margin-left: 22px;" name="cmd" id="cmd" value="  Clear  ">
		</div>
		<div class="col-md-4">	
                    
		</div>
	</div>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-9" style="font-size:20px;">
                <b>Please Note &nbsp;:   &nbsp;Book which is issued at least one time cannot be deleted. </b>
            </div>
        </div>
	

	
	
</div>
    
</form>
<%@include file="footer.jsp"%>
</body>
</html>
