<div class="row">
            <nav class="col-sm-12 navbar navbar-expand-sm bg-dark navbar-dark " ><!--Navigation bar-->
                <!-- navbar is just to define navigation bar
                navbar-expand-sm arranges link in horizontal order
                bg-dark background color dark 
                navbar-dark it color of the text light 
                -->
                <a class="navbar-brand" href="#">IIIT Bhagalpur</a>
                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!--Navbar links-->
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class ="navbar-nav">
		
                    <li class = "nav-item active"> 
                        <a class="nav-link" href="#"> Link 1 </a>
                    </li>
                     <!-- Dropdown -->
                     <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Dropdown link
                            </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Link 1a</a>
                            <a class="dropdown-item" href="#">Link 1b</a>
                            <a class="dropdown-item" href="#">Link 1c</a>
                        </div>
                     </li>
                    <li  class = "nav-item"> 
                        <a class="nav-link" href="#"> Link 2 </a>
                    </li>
                    <li  class = "nav-item">
                        <a class="nav-link disabled" href="#"> Link 3 </a>
                    </li>
                </ul>
                </div>
                </nav><!--Navigation bar ends -->
            </div>