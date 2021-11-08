<%@include file="header.jsp"%>
    </head>
    <body>
        <div class="container-fluid"><!--body container-->
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
            
            <!--************************************************body row 2  ***********************************************-->
            <%@include file='menu.jsp'%>
            <!--body row 2 ends -->
            <!--************************************************body row 3 **********************************************-->
            <div class="row" style="top-margin:10px;">
                
                <div id="demo" class="carousel slide col-sm-12" data-ride="carousel" data-interval="2000">
                <!-- Indicators -->
                    <ul class="carousel-indicators" >
                        <li data-target="#demo" data-slide-to="0" class="active"></li>
                        <li data-target="#demo" data-slide-to="1" ></li>
                        <li data-target="#demo" data-slide-to="2" ></li>
                        
                    
                    </ul>
                    <!-- The slideshow -->
                    <div class="carousel-inner">
			<div class="carousel-item active ">
				<img src="images/pic4.jpg" alt="Nature 1" width="100%" height="400px" >
				<div class="carousel-caption ">
					<h3>Library photo</h3>
					<p>scene 1</p>
				</div>
			</div>
			<div class="carousel-item ">
                            <img src="images/pic2.jpg" alt="Nature 2" width="100%" height="400px" >
				<div class="carousel-caption text-color">
					<h3>Library photo</h3>
					<p>scene 2</p>
				</div>
			</div>
			<div class="carousel-item ">
				<img src="images/pic3.jpg" alt="Nature 1" width="100%" height="400px" >
				<div class="carousel-caption text-color">
					<h3>Library photo</h3>
					<p>scene 3</p>
				</div>
			</div>
			
                        
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		  <span class="carousel-control-prev-icon"></span>
                     </a>
                    <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                    </a>
	    </div>
            <!--<div class="col-sm-1"></div>-->
	  </div><!--body row 3 ends-->
          <!--**************************************************body row 4 ***********************************-->
          <div class="row" style="background-color:grey;margin-top:10px;" >
              <div class="col-sm-3 container"  >
                  <div class="col-sm-11" style="background-color:white; margin:20px; padding-top:1px; height:300px; box-shadow:0px 0px 10px black; border-radius:20px;">
                        <div class="card_heading">
                        <h1>Latest Book</h1>
                        </div>
                        <ul>
                            <li>HC Verma</li>
                            <li>Organics Chemistry</li>
                            <li>Theory of Relativity</li>
                            <li>Internet of Things</li>
                        </ul>
                        
                    </div>
              </div>
              
              <div class="col-sm-3 container" >
                  <div class="col-sm-11" style="background-color:white; margin:20px; padding-top:1px; height:300px; box-shadow:0px 0px 10px black; border-radius:20px;">
                        <div class="card_heading">
                        <h1>Latest Book</h1>
                        </div>
                        <ul>
                            <li>HC Verma</li>
                            <li>Organics Chemistry</li>
                            <li>Theory of Relativity</li>
                            <li>Internet of Things</li>
                        </ul>
                        
                    </div>
              </div>
              
              <div class="col-sm-3 container" >
                  <div class="col-sm-11" style="background-color:white; margin:20px;padding-top:1px; height:300px; box-shadow:0px 0px 10px black; border-radius:20px;">
                        <div class="card_heading">
                        <h1>Latest Book</h1>
                        </div>
                        <ul>
                            <li>HC Verma</li>
                            <li>Organics Chemistry</li>
                            <li>Theory of Relativity</li>
                            <li>Internet of Things</li>
                        </ul>
                    </div>
              </div>
              
              <div class="col-sm-3 container" >
                  <div class="col-sm-11" style="background-color:white; margin:20px; padding-top:1px;height:300px; box-shadow:0px 0px 10px black; border-radius:20px;">
                        <div class="card_heading">
                        <h1>Login Links</h1>
                        </div>
                        <ul>
                            <li><a href="#">Student</a></li>
                            <li><a href="#">Librarian</a></li>
                            <li><a href="#">Admin</a></li>
                            
                        </ul>
                    </div>
              </div>

          </div>
          <!--******************************************body row 5 footer**********************************-->
          <div class="row footer">
              <div class="col-sm-4">
                  
              </div>
              <div class="col-sm-4">
                  <br><br><br><br><br><br><br>
                  Developed by: Rakesh Bhaiaya
                  <br><br><br><br><br>
              </div>
              <div class="col-sm-4"></div>
              
          </div>
         
</div><!--body container ends-->
</body>
</html>
