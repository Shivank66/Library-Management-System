<%@page import="bookpackage.Member"%>
<%
    String siteuserno="";
    int memberno=-1;
    String table="";
    String query="";
    try{
        siteuserno=LoginManager.siteuserno(LoginManager.getCurrentUser(session),session);
        memberno=Member.getMembernoBySiteUserno(Integer.parseInt(siteuserno), session);
         query="select * from bookissue where userid="+memberno+"and actualreturndate is not null";
         try
         {
         table=dbpackage.DbConfig.getTable(query, "", "", "", session);
         }
         catch(Exception ex)
         {
             table="NO BOOK ISSUE RECORD";
         }
    }   
    catch(Exception ex){
        out.println(ex.getMessage());
    }

%>
<%@include file="header.jsp"%>
<title>Member History</title>
<style>
    
</style>
</head>
<body class="container-fluid" >
 <%@include file="menu.jsp"%>
 <div class="container minheight ">
    <div class="row table1">
        <%=table%>
    </div>
 </div>

<%@include file="footer.jsp"%>
 </body>
</html>
