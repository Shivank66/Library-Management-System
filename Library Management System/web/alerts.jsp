<%@page import="validationspackage.AlertsAndMessages"%>
<%@include file="header.jsp" %>  

<title>Bootstrap Example</title>

</head>
    <body>
       <%
       String alert=AlertsAndMessages.showSuccess("Success", "This is the message");
       out.println(alert);
       
       %>
    </body>
</html>
