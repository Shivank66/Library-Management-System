<%
     
     if(!(LoginManager.protectPageAdmin(response,session)))
       return;
%>

<%
            String table=dbpackage.DbConfig.getTable("select a.sno,a.siteuserno, s.SITEUSERNAME,a.activity,to_char(a.adate,'Dy,dd-Mon-yyyy.hh:mm AM') as \"DATE TIME\" from ActivityLog a join siteusers s on a.siteuserno=s.siteuserno order by sno desc","","","",session);
%>
<%@include file="header.jsp"%>
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
			<h1>Activity History</h1>
		</div>
		<div class="col-md-3">	
		
		</div>
	</div>
	<div class="row">
            <div class="col-md-1">
		</div>
		<div class="col-md-7 form-group">
			<div class="form-group">
			Search<br>
                        <input type="text" class="input form-control " placeholder="Type anything to Search" id="bid" name="SiteUid" onkeyup="Search('bid','tableid','countid')" value="">
                        
			</div>
		</div>
                <div class="col-md-1 form-group">
			
                    
		</div>
		<div class="col-md-2">	
		
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