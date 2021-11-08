<%@page import="loginpackage.LoginManager"%>
<%

    String login = "<a href=\"logout.jsp\" >Logout</a>";
    if (!LoginManager.isUserLoggedIn(session))
        login="<a href=\"loginmodal.jsp\" >Login</a>";
    
    
        
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
                        <a class="nav-link" href="Index.jsp"> Home </a>
                    </li>
                    <li class="nav-item dropdown  col-sm-1">
                            
                        <!--<div class="dropdown">-->
                         <button class="btn nav-link" data-toggle="dropdown" >UserType</button>
                            <div class="dropdown-content">
                                <a href="usertypeswala.jsp">Entry</a>
                                <a href="usertypetable.jsp">View & Update</a>
                                
                            </div>
                        <!--</div>-->

                     </li>
                     <!-- Dropdown -->
                     <li class="nav-item dropdown  col-sm-1">
                            
                        <!--<div class="dropdown">-->
                         <button class="btn nav-link" data-toggle="dropdown" >Book</button>
                            <div class="dropdown-content">
                                <a href="book.jsp">Book Entry</a>
                                <a href="#">Book Update</a>
                                <a href="#">Book Delete</a>
                            </div>
                        <!--</div>-->

                     </li>
                     
                    <li  class = "nav-item  col-sm-1"> 
                        <a class="nav-link" href="Member.jsp"> Register </a>
                    </li>
                    <li  class = "nav-item  col-sm-2">
                        <a class="nav-link " href="bookissue.jsp"> Book Issue </a>
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
            <div class="row">
             
             </div>
<!--Navigation bar ends -->
           