

<%@page import="loginpackage.LoginManager"%>
<%
    String uName;
    String pass;
    String check = request.getParameter("check");
    boolean isPostback= false;
    if(check!=null){
        isPostback= true;
    }
    if(isPostback){
        try{
          uName=request.getParameter("uname");
          pass=request.getParameter("pwd");
          boolean b=LoginManager.doLogin(uName, pass, session, response);
          if(!b)
              out.println("Login Failed");
        }
        catch(Exception ex){
            
        }
    }
    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
        
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
      .card_heading{
          margin-top:20px;
          box-shadow:0px 0px 3px black;
          background-color:orange;
          border-radius:8px;
      }
      .footer{
          background-color:#011844;
          color:white;
          height:300px;
      }
      .text-color
      {
          color:teal;
      }
      .cont
{
margin-top:20px;
margin-bottom:20px;
margin-left:100px;
margin-right:100px;
background-color:teal;
padding-bottom:100px;
color:white;
box-shadow:0px 0px 20px black;
border-radius:20px;
}
</style>

        <title>JSP Page</title>
    </head>
    <body class="container-fluid">
        <div class="conatiner cont">
            <div class='row'>
                
            </div>
        <form action="loginpage.jsp" method="post">
            <input type="hidden" id='check' name='check'>
         <div class="row">
            <div class='col-sm-3' >
    
            </div>
            <div class='col-sm-6' >
             <center><h1>Login</h1></center>
    
            </div>
        </div>
        <div class="row">
            <div class='col-sm-3' >
    
            </div>
            <div class='col-sm-6' >
             UserName:<br>
             <input type='text' class="input form-control" id='uName' name='uname' placeholder='UserName'>
    
            </div>
        </div>
        <div class="row">
            <div class='col-sm-3' >
    
            </div>
            <div class='col-sm-6' >
             Password:<br>
             <input type='text' class="input form-control" id='uName' name='pwd' placeholder='Password'>
    
            </div>
         </div>
         <div class="row">
            <div class='col-sm-4' >
                
            </div>
            <div class='col-sm-2' >
             <br>
             <input type='submit' class="input form-control" id='uName' name='uName' placeholder='Password'>
    
            </div>
         </div>
        </form>
           </div>
    </body>
</html>
