<%
     
        if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%@page import="bookpackage.Book"%>
<%
    int bookid; 
    String bookName;
    String  publisher;
    String author;
    String edition;
    int price;
    int location;
    String check;
    String alert="";
    check=request.getParameter("check");
    boolean isPostback=false;
    if (check!=null){
        isPostback=true;
    }
    if(isPostback)
    {
        try {
            bookName=request.getParameter("bName");
            author=request.getParameter("Aut");
            publisher=request.getParameter("pub");
            edition=request.getParameter("Edi");
            location=0;
            price=Integer.parseInt(request.getParameter("Pri"));
            Book b = new Book(bookName, publisher, author, edition, price, location);
        
            b.save(session);
            bookid=b.getBookid();
           alert=validationspackage.AlertsAndMessages.showSuccess("Success!!", "Data inserted ");
         }       
        catch (Exception ex)
        {
            System.err.println(ex);
            alert=validationspackage.AlertsAndMessages.showWarning("Warning!!", "Something went wrong");
        }
    }


%>
<%@include file="header.jsp"%>


</head>
<body class="container-fluid">
<%@include file="menu.jsp"%>
<form action="book.jsp" method="post">
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
			<h1>Book Entry</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class ="col-md-4">
			
			<div class="form-group">
			Book Name<br>
			<input type="text" class="input form-control " placeholder="Book Name" id="bName" name="bName" >
			</div>
			
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Publisher<br>
			<input type="text" class="input form-control" id="pub" name="pub" placeholder="Publisher">
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
                                <input type="text" class="input form-control" id="Aut" name="Aut" placeholder="Author">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			<div class="form-group">
			Price<br>
			<input type="text" class="input form-control " id="Pri" name="Pri" placeholder="Price" >
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
			<input type="text" class="input form-control " id="Edi" name="Edi" placeholder="Edition">
			</div>
		</div>
		<div class ="col-md-4 form-group">
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	
	
		
    
	<div class="row">
		<div class="col-md-5 form-group">
			
		</div>
                <div class="col-md-4 form-group">
			
			<input type="submit" class="button" name="cmd" value=" Register ">
		</div>
		<div class="col-md-2">	
		
		</div>
	</div>
	

	
	
</div>
    
</form>
<%@include file="footer.jsp"%>
</body>
</html>
