<%@page import="loginpackage.LoginManager"%>
<%
    String login = "  <!-- Button to Open the Modal -->\n" +
"  <button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#myModal\">\n" +
"    Log In \n" +
"  </button>\n" +
"\n" +
"  <!-- The Modal -->\n" +
"  <div class=\"modal fade\" id=\"myModal\">\n" +
"    <div class=\"modal-dialog\">\n" +
"      <div class=\"modal-content\">\n" +
"      \n" +
"        <!-- Modal Header -->\n" +
"        <div class=\"modal-header\" style=\"background-color:teal\">\n" +
"          \n" +
"          <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n" +
"        </div>\n" +
"        \n" +
"        <!-- Modal body -->\n" +
"        <div class=\"modal-body\">\n" +
"          <div class=\"container\">\n" +
"	<div class=\"d-flex justify-content-center h-100\">\n" +
"		<div class=\"card\">\n" +
"			<div class=\"card-header\">\n" +
"				<h3>Log In</h3>\n" +
"				<div class=\"d-flex justify-content-end social_icon\">\n" +
"					<span><i class=\"fab fa-facebook-square\"></i></span>\n" +
"					<span><i class=\"fab fa-google-plus-square\"></i></span>\n" +
"					<span><i class=\"fab fa-twitter-square\"></i></span>\n" +
"				</div>\n" +
"			</div>\n" +
"			<div class=\"card-body\">\n" +
"				<form>\n" +
"					<div class=\"input-group form-group\">\n" +
"						<div class=\"input-group-prepend\">\n" +
"							<span class=\"input-group-text\" style=\"background-color:teal; color:white;\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-person-bounding-box\" viewBox=\"0 0 16 16\">\n" +
"  <path d=\"M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z\"/>\n" +
"  <path d=\"M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z\"/>\n" +
"</svg> </span>\n" +
"						</div>\n" +
"						<input type=\"text\" class=\"form-control\" placeholder=\"username\">\n" +
"						\n" +
"					</div>\n" +
"					<div class=\"input-group form-group\">\n" +
"						<div class=\"input-group-prepend\">\n" +
"							<span class=\"input-group-text\" style=\"background-color:teal; color:white;\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-key\" viewBox=\"0 0 16 16\">\n" +
"  <path d=\"M0 8a4 4 0 0 1 7.465-2H14a.5.5 0 0 1 .354.146l1.5 1.5a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0L13 9.207l-.646.647a.5.5 0 0 1-.708 0L11 9.207l-.646.647a.5.5 0 0 1-.708 0L9 9.207l-.646.647A.5.5 0 0 1 8 10h-.535A4 4 0 0 1 0 8zm4-3a3 3 0 1 0 2.712 4.285A.5.5 0 0 1 7.163 9h.63l.853-.854a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.793-.793-1-1h-6.63a.5.5 0 0 1-.451-.285A3 3 0 0 0 4 5z\"/>\n" +
"  <path d=\"M4 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z\"/>\n" +
"</svg></span>\n" +
"						</div>\n" +
"						<input type=\"password\" class=\"form-control\" placeholder=\"password\">\n" +
"					</div>\n" +
"					<div class=\"row align-items-center remember\">\n" +
"						<input type=\"checkbox\">Remember Me\n" +
"					</div>\n" +
"					<div class=\"form-group\">\n" +
"						<input type=\"submit\" value=\"Login\" class=\"btn float-right login_btn\">\n" +
"					</div>\n" +
"				</form>\n" +
"			\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"        \n" +
"        <!-- Modal footer -->\n" +
"        <div class=\"modal-footer\">\n" +
"          \n" +
"        </div>\n" +
"        \n" +
"      </div>\n" +
"    </div>\n" +
"  </div>\n" +
"  \n" +
"\n" +
"      ";
try{
        if(LoginManager.protectPage(response, session))
        {
            login="Logged In";
        }
    }
    catch(Exception ex){
        login="failed";
    }
    
    
    
%>


            <div class="row">
            <nav class="col-sm-12 navbar navbar-expand-sm bg-dark navbar-dark container-fluid " ><!--Navigation bar-->
                <!-- navbar is just to define navigation bar
                navbar-expand-sm arranges link in horizontal order
                bg-dark background color dark 
                navbar-dark it color of the text light 
                -->
                <a class="navbar-brand col-sm-1" href="#">IIIT Bhagalpur</a>
                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!--Navbar links-->
                <div class="collapse navbar-collapse col-sm-10 " id="collapsibleNavbar">
                <ul class ="navbar-nav container-fluid">
		
                    <li class = "nav-item active col-sm-1 "> 
                        <a class="nav-link" href="#"> Link 1 </a>
                    </li>
                     <!-- Dropdown -->
                     <li class="nav-item dropdown  col-sm-2">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Dropdown link
                            </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Link 1a</a>
                            <a class="dropdown-item" href="#">Link 1b</a>
                            <a class="dropdown-item" href="#">Link 1c</a>
                        </div>
                     </li>
                    <li  class = "nav-item  col-sm-1"> 
                        <a class="nav-link" href="#"> Link 2 </a>
                    </li>
                    <li  class = "nav-item  col-sm-1">
                        <a class="nav-link disabled" href="#"> Link 3 </a>
                    </li>
                    <li  class = "nav-item  col-sm-6">
                        
                    </li>
                    <li  class = "nav-item  col-sm-2 ">

                    </li>
                </ul>
                </div>
                                        <!--Login Button Starts here-->
                 <div class="col-sm-1">
                     <%=login%>
                 </div>
      <!--Login button ends here-->
                </nav><!--Navigation bar ends -->
            </div>
<!--Navigation bar ends -->
           