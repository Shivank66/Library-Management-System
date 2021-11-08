<%@page import="loginpackage.LoginManager"%>
<%

    String login = "<a href=\"logout.jsp\" >Logout</a>";
    String ut="";
    String menu="<li class = \"nav-item active col-sm-1 \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item   col-sm-2\">\n" +
"                            \n" +
"                        <a class=\"nav-link\" href=\"#\">About Us</a>\n" +
"\n" +
"                     </li>\n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  col-sm-1\">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                    \n" +
"                    <li  class = \"nav-item  col-sm-2\">\n" +
"                        \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-6\">\n" +
"                       \n" +
"                       \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-2 \">\n" +
"\n" +
"                    </li>";
    if (!LoginManager.isUserLoggedIn(session))
        login="<a href=\"loginmodal.jsp\" >Login</a>";
if (LoginManager.isUserLoggedIn(session))
{
     ut=LoginManager.getCurrentUserType(session);
    if(ut.equals("Admin"))
    {
        menu="<li class = \"nav-item active col-sm-1 \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item dropdown  col-sm-1\">\n" +
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
"                     <li class=\"nav-item dropdown  col-sm-1\">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >Book</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"book.jsp\">Book Entry</a>\n" +
"                                <a href=\"#\">Book Update</a>\n" +
"                                <a href=\"#\">Book Delete</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                    <li  class = \"nav-item  col-sm-1\"> \n" +
"                        <a class=\"nav-link\" href=\"Member.jsp\"> Register </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-2\">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\"> Book Issue </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-6\">\n" +
"                       \n" +
"                       \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-2 \">\n" +
"\n" +
"                    </li>";
    }
    else if(ut.equals("Clerk"))
    {
        menu="<li class = \"nav-item active col-sm-1 \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    \n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  col-sm-1\">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >Book</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"book.jsp\">Book Entry</a>\n" +
"                                <a href=\"#\">Book Update</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                     \n" +
"                    <li  class = \"nav-item  col-sm-1\"> \n" +
"                        <a class=\"nav-link\" href=\"Member.jsp\"> Register </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-1\">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\">Return</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-1\">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\">Issue</a>\n" +
"                    </li>\n" +
"                    \n" +
"                    <li  class = \"nav-item  col-sm-2\">\n" +
"                       \n" +
"                       <a class=\"nav-link\" href=\"#\">About Us</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-5\">\n" +
"\n" +
"                    </li>";
    }
    else
    {
        menu="<li class = \"nav-item active col-sm-1 \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item dropdown  col-sm-1\">\n" +
"                        <a class=\"nav-link\" href=\"#\">History</a>\n" +
"                        \n" +
"\n" +
"                     </li>\n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  col-sm-2\">\n" +
"                        <a class=\"nav-link\">Books to Return </a>\n" +
"                        \n" +
"\n" +
"                     </li>\n" +
"                     \n" +
"                    <li  class = \"nav-item  col-sm-2\"> \n" +
"                        <a class=\"nav-link\">About Us</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-1\">\n" +
"                        \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-4\">\n" +
"                       \n" +
"                       \n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  col-sm-1 \">\n" +
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
                <div class="collapse navbar-collapse col-sm-10 " id="collapsibleNavbar">
                <ul class ="navbar-nav container-fluid">
		
                    <%=menu%>
                </ul>
                </div>
                                        <!--Login Button Starts here-->
                 <div class="col-sm-1">
                    
                     <%=login%>
                 </div>
      <!--Login button ends here-->
                </nav><!--Navigation bar ends -->
            </div>
            <div class="row">
             
             </div>
<!--Navigation bar ends -->
           