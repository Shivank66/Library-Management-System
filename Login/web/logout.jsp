<%@page import="loginpackage.LoginManager"%>
<%
LoginManager.doLogout(response, session);
%>