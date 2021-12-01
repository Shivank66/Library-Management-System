<%@page import="bookpackage.Payment"%>
<%@page import="loginpackage.LoginManager"%>

<%

    String siteusername=LoginManager.getCurrentUser(session);
    
    String ut="";
    //String password_change="<a class=\"nav-link\" href=\"ChangePassword.jsp\"> Change Password </a>";
    //String login = "<div class=\"dropdown\">\n" +
//"  <button type=\"button\" class=\"container btn btn-primary dropdown-toggle\" style=\" min-width:150px;   \" data-toggle=\"dropdown\">\n" +
//"   <div class=\"row\"><div class=\"col-sm-2\"style=\"padding-right:5px;\"> <svg padding-right=\"10px\" xmlns=\"http://www.w3.org/2000/svg\" width=\"18\" height=\"18\" fill=\"currentColor\" class=\"bi bi-person-circle\" viewBox=\"0 0 16 16\">\n" +
//"  <path d=\"M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z\"/>\n" +
//"  <path fill-rule=\"evenodd\" d=\"M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z\"/>\n" +
//"</svg></div></div>"+siteusername+"\n" +
//"  </button>\n" +
//"  <div class=\"dropdown-menu\">\n" +
//"    <a class=\"dropdown-item\" href=\"ChangePassword.jsp\">Change Password</a>\n" +
//"    <a class=\"dropdown-item\" href=\"logout.jsp\">Log Out</a>\n" +
//"  </div>\n" +
//"</div>";
String login="<li class=\"nav-item dropdown \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn btn-primary  \" data-toggle=\"dropdown\" >"
        +"  <div class=\"row\"> <div class=\"col-sm-2\"> <svg  xmlns=\"http://www.w3.org/2000/svg\" width=\"18\" height=\"18\" fill=\"currentColor\" class=\"bi bi-person-circle\" viewBox=\"0 0 16 16\">\n" +
"  <path d=\"M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z\"/>\n" +
"  <path fill-rule=\"evenodd\" d=\"M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z\"/>\n" +
"</svg></div><div class=\" col-sm-5\">"+siteusername+"</div></div>\n"
        + "</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"ChangePassword.jsp\">Change Password</a>\n" +
"                                <a href=\"logout.jsp\">Log Out</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n";
    
    String menu="<li class = \"nav-item active  \"> \n" +
"                        <a class=\"nav-link\" href=\"Index.jsp\"> Home </a>\n" +
"                    </li>\n" +
"                    <li class=\"nav-item   \">\n" +
"                            \n" +
"                        <a class=\"nav-link\" href=\"https://www.iiitbh.ac.in/index.php/contact-us\" target=\"IIIT\">About Us</a>\n" +
"\n" +
"                     </li>\n" +
"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         \n" +
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
        login="<form action=\"loginmodal.jsp\" method=\"post\"><button type=\"submit\" class=\"btn btn-primary\">Login</button></form>";
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
"<li class = \"nav-item   \"> \n" +
"                        <a class=\"nav-link\" href=\"ActivityLogTable.jsp\"> Activity </a>\n" +
"                    </li>\n"+
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
                " <a href=\"booktable.jsp\">Book list</a>\n"+
"                                <a href=\"book.jsp\">Book Entry</a>\n" +
"                                <a href=\"Bookupdate.jsp\">Book Update</a>\n" +
"                                <a href=\"Bookdelete.jsp\">Book Delete</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
                "                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >Register</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                <a href=\"Clerk.jsp\">Clerk</a>\n" +
"                                <a href=\"Member.jsp\">Member</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +

"                     <!-- Dropdown -->\n" +
"                     <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >View & Update</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
                //" <a href=\"booktable.jsp\">Book list</a>\n"+
"                                <a href=\"booktable.jsp\">Book</a>\n" +
"                                <a href=\"MemberList.jsp\">Member</a>\n" +

"                                <a href=\"ClerkList.jsp\">Clerk</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
                
"                     \n" +

"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\"> Book Issue </a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookreturntable.jsp\">Return</a>\n" +
"                    </li>\n" +
"                   <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"duelist.jsp\">Fine</a>\n" +
"                    </li>\n"+
"                    <li  class = \"nav-item    \">\n" +""
                + "<a class=\"nav-link\" href=\"https://www.iiitbh.ac.in/index.php/contact-us\" target=\"IIIT\">About Us</a>\n"+
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
"                     <li class=\"nav-item dropdown  \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn nav-link\" data-toggle=\"dropdown\" >View & Update</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
                //" <a href=\"booktable.jsp\">Book list</a>\n"+
"                                <a href=\"booktable.jsp\">Book</a>\n" +
"                                <a href=\"MemberList.jsp\">Member</a>\n" +


"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookreturntable.jsp\">Return</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"bookissue.jsp\">Issue</a>\n" +
"                    </li>\n" +
                "                    <li  class = \"nav-item  \">\n" +
"                        <a class=\"nav-link \" href=\"duelist.jsp\">Fine</a>\n" +
"                    </li>\n" +
"                    \n" +
"                    <li  class = \"nav-item  \">\n" +
"                       \n" +
"                       <a class=\"nav-link\" href=\"https://www.iiitbh.ac.in/index.php/contact-us\" target=\"IIIT\">About Us</a>\n" +
"                    </li>\n" +
"                    <li  class = \"nav-item  \">\n" +
"\n" +
"                    </li>";
    }
    else
    {
        int finetopay=Payment.remainingFineBySiteUserno(Integer.parseInt(LoginManager.getCurrentSiteUserno(session)),session);
        login="<li class=\"nav-item dropdown \">\n" +
"                            \n" +
"                        <!--<div class=\"dropdown\">-->\n" +
"                         <button class=\"btn btn-primary  \" data-toggle=\"dropdown\" >"
        +"  <div class=\"row\"> <div class=\"col-sm-2\"> <svg  xmlns=\"http://www.w3.org/2000/svg\" width=\"18\" height=\"18\" fill=\"currentColor\" class=\"bi bi-person-circle\" viewBox=\"0 0 16 16\">\n" +
"  <path d=\"M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z\"/>\n" +
"  <path fill-rule=\"evenodd\" d=\"M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z\"/>\n" +
"</svg></div><div class=\" col-sm-5\">"+siteusername+"</div></div>\n"
        + "</button>\n" +
"                            <div class=\"dropdown-content\">\n" +
"                                  <a href=\"#\"> Fine : "+ finetopay+" Rs.</a>\n"+
"                                <a href=\"ChangePassword.jsp\">Change Password</a>\n" +
"                                <a href=\"logout.jsp\">Log Out</a>\n" +
"                            </div>\n" +
"                        <!--</div>-->\n" +
"\n" +
"                     </li>\n";
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
"                        <a href=\"https://www.iiitbh.ac.in/index.php/contact-us\" target=\"IIIT\" class=\"nav-link\">About Us</a>\n" +
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


            <!--******************************************body row 1 banner ***********************************************-->
            <div class="row" >
                
                <div class="col-sm-1">
                    <img src="images/Logo.png" style="width:200px;padding:20px;" >
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-6">
                    <center><h1>Indian Institute of Information Technology Bhagalpur</h1></center>
                    <center><h3>Library Management System</h3></center>
                </div>
                <div class="col-sm-1"></div>
                    
                
                
                <div class="col-sm-2">
                    <img src="images/logo2.png" style="width:200px;padding:20px;" >
                </div>
                    
                
            </div><!--body row 1 banner end-->
            
            <div class="row sticky bottom-shadow">
            <nav class="  col-sm-12 navbar navbar-expand-sm bg-dark navbar-dark  " ><!--Navigation bar-->
                <!-- navbar is just to define navigation bar
                navbar-expand-sm arranges link in horizontal order
                bg-dark background color dark 
                navbar-dark it color of the text light 
                -->
                <a class="navbar-brand " href="#">IIIT Bhagalpur</a>
                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!--Navbar links-->
                <div class="collapse navbar-collapse " id="collapsibleNavbar">
                <ul class ="navbar-nav mr-auto">
		
                    <%=menu%>
                </ul>
                </div>
                
                 
                 <ul class="navbar-nav ml-auto">                       <!--Login Button Starts here-->
                 <!--<div class="col-sm-2">-->
                   <li class="nav-item"> 
                     <%=login%>
                     </li>
                     <li class="nav-item"> 
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                     </li>
                 <!--</div>-->
                 </ul>
                
      <!--Login button ends here-->
                </nav><!--Navigation bar ends -->
            </div>
            <div class="row">
             
             </div>
<!--Navigation bar ends -->
           