<%@page import="loginpackage.LoginManager"%>
<%

    String siteusername=LoginManager.getCurrentUser(session);
    
    String ut="";
    //String password_change="<a class=\"nav-link\" href=\"ChangePassword.jsp\"> Change Password </a>";
    String login = "<div class=\"dropdown\">\n" +
"  <button type=\"button\" class=\"container btn btn-primary dropdown-toggle\" style=\" min-width:150px;   \" data-toggle=\"dropdown\">\n" +
"   <div class=\"row\"><div class=\"col-sm-2\"style=\"padding-right:5px;\"> <svg padding-right=\"10px\" xmlns=\"http://www.w3.org/2000/svg\" width=\"18\" height=\"18\" fill=\"currentColor\" class=\"bi bi-person-circle\" viewBox=\"0 0 16 16\">\n" +
"  <path d=\"M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z\"/>\n" +
"  <path fill-rule=\"evenodd\" d=\"M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z\"/>\n" +
"</svg></div></div>"+siteusername+"\n" +
"  </button>\n" +
"  <div class=\"dropdown-menu\">\n" +
"    <a class=\"dropdown-item\" href=\"ChangePassword.jsp\">Change Password</a>\n" +
"    <a class=\"dropdown-item\" href=\"logout.jsp\">Log Out</a>\n" +
"  </div>\n" +
"</div>";
    
    String menu="<li class = \"nav-item active  \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item   \">\n" +
"                            \n" +
"                        <a class=\"nav-link\" href=\"www.iiitbh.ac.in/index.php/contact-us\">About Us</a>\n" +
"\n" +
"                     </li>\n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                    \n" +
"                    <li  class = \"nav-item  \">\n" +
"                        \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item \">\n" +
"                       \n" +
"                       \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item   \">\n" +
"\n" +
"                    </li>";
    if (!LoginManager.isUserLoggedIn(session))
    {
        login="<a href=\"loginmodal.jsp\" >Login</a>";
        //password_change="";
    }
if (LoginManager.isUserLoggedIn(session))
{
     ut=LoginManager.getCurrentUserType(session);
    if (LoginManager.isUserAdmin(session))//if(ut.equals("Admin"))
    {
        
        menu="<li class = \"nav-item active  \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >UserType</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"usertypeswala.jsp\">Entry</a>\n" +
"                                <a href=\"usertypetable.jsp\">View & Update</a>\n" +
"                                \n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >Book</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"book.jsp\">Book Entry</a>\n" +
"                                <a href=\"Bookupdate.jsp\">Book Update</a>\n" +
"                                <a href=\"Bookdelete.jsp\">Book Delete</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                    <li  class = \"nav-item  \"> \n" +
"                        <a class=\"nav-link\" href=\"Member.jsp\"> Register </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\"> Book Issue </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookreturntable.jsp\">Return</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item    \">\n" +""
                + "<a class=\"nav-link\" href=\"https://www.iiitbh.ac.in/index.php/contact-us\">About Us</a>\n"+
"                       \n" +
"                       \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item   \">\n" +
"\n" +
"                    </li>";
    }
    else if(LoginManager.isUserClerk(session))//if(ut.equals("Clerk"))
    {
        menu="<li class = \"nav-item active  \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    \n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >Book</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"book.jsp\">Book Entry</a>\n" +
"                                <a href=\"Bookupdate.jsp\">Book Update</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                     \n" +
"                    <li  class = \"nav-item  \"> \n" +
"                        <a class=\"nav-link\" href=\"Member.jsp\"> Register </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookreturntable.jsp\">Return</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\">Issue</a>\n" +
"                    </li>\n" +
"                    \n" +
"                    <li  class = \"nav-item  \">\n" +
"                       \n" +
"                       <a class=\"nav-link\" href=\"https://www.iiitbh.ac.in/index.php/contact-us\">About Us</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"\n" +
"                    </li>";
    }
    else
    {
        menu="<li class = \"nav-item active  \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item dropdown  \">\n" +
"                        <a class=\"nav-link\" href=\"memberHistory.jsp\">History</a>\n" +
"                        \n" +
"\n" +
"                     </li>\n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  \">\n" +
"                        <a class=\"nav-link\" href=\"memberBooksToReturn.jsp\">Books to Return </a>\n" +
"                        \n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                    <li  class = \"nav-item  \"> \n" +
"                        <a href=\"https://www.iiitbh.ac.in/index.php/contact-us\" target=\"\" class=\"nav-link\">About Us</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                       \n" +
"                       \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item   \">\n" +
"\n" +
"                    </li>";
        
    }
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
                <div class="collapse navbar-collapse col-sm-9" id="collapsibleNavbar">
                <ul class ="navbar-nav">
		
                    <%=menu%>
                </ul>
                </div>
                 
                                        <!--Login Button Starts here-->
                 <div class="col-sm-2">
                    
                     <%=login%>
                 </div>
                
      <!--Login button ends here-->
                </nav><!--Navigation bar ends -->
            </div>
            <div class="row">
             
             </div>
<!--Navigation bar ends -->
           