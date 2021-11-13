<%
     
        if(!(LoginManager.protectPageAdminClerk(response,session)))
       return;
%>
<%@page import="loginpackage.LoginManager"%>
<%@page import="bookpackage.Book"%>
<%@page import="bookpackage.BookIssue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbpackage.DbConfig"%>
<%@page import = "java.sql.PreparedStatement"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>  
<%
            String table=dbpackage.DbConfig.getTable("select * from bookissue where actualreturndate is null","Action","Return","bookreturn.jsp",session);
%>
<%@include file="header.jsp"%>
<script>
function Search(textboxid,tableid,recordcounttext) {
        var input, filter, table, tr, td, i;
        input = document.getElementById(textboxid);
        filter = input.value.toUpperCase();



        table = document.getElementById(tableid);
        tr = table.getElementsByTagName("tr");
        var noofrows = tr.length;
        var count = 0;
        for (i = 1; i <= noofrows - 1; i++) {
            var noofcols = tr[i].getElementsByTagName("td").length;
            var textdata = "";
            for (j = 0; j <= noofcols - 1; j++) {
                currenttd = tr[i].getElementsByTagName("td")[j];
                if (currenttd) {
                    textdata += currenttd.textContent || currenttd.innerText;
                }
            }
            //  alert(textdata);

            if (textdata.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
                count++;
            } else {
                tr[i].style.display = "none";
            }
        }
        document.getElementById(recordcounttext).value = count;
    }
    
    </script>
</head>
<body class="container-fluid">
<%@include file="menu.jsp"%>
<div class="container-fluid">
    <form action="bookreturntable.jsp" method="post">
    <div class='row'>
        <div class="col-sm-12">
            
        </div>
    </div>

<div class="row">
<div class="container cont ">
   <input type ="hidden" name="check">
	<div class="row">
		<div class="col-md-3">
		
		</div>
		<div class="col-md-6 " style="padding-left:80px">
			<h1>Book Return</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	<div class="row">
            <div class="col-md-1">
		</div>
		<div class="col-md-7 form-group">
			<div class="form-group">
			Book ID<br>
                        <input type="text" class="input form-control " placeholder="Book ID" id="bid" name="bid" onkeyup="Search('bid','tableid','countid')" value="">
			</div>
		</div>
                <div class="col-md-1 form-group">
			
                   
		</div>
		
		</div>
        </div>
	 
	
	
	
	
	
	
	
	
	
       

	
	
    
	
</div>

</form>


</div>
<div class="row">
           <div class="col-sm-1"></div>
          <div class="col-sm-10" style="margin-bottom: 20px"><%=table%></div>
         
      </div>
<%@include file="footer.jsp"%>
</body>
</html>
