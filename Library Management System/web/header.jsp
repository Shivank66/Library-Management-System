<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  
        
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="shortcut icon" href="images/Logo.png" type="image/x-icon">
   <meta name="theme-color" content="#308D46">
   <meta name="image" property="og:image" content="https://media.geeksforgeeks.org/wp-content/cdn-uploads/gfg_200x200-min.png">
   <meta property="og:image:type" content="image/png">
   <meta property="og:image:width" content="200">
   <meta property="og:image:height" content="200">
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
          
          min-height:300px;
                           
                                   
                
      }
      .text-color
      {
          color:teal;
      }
      .cont
{
margin-top:20px;
margin-bottom:20px;
background-color:teal;
padding-bottom:100px;
color:white;
box-shadow:0px 0px 20px black;
border-radius:20px;
}

/*.input{
1width:300px;
border-style:solid;
border-radius:10px;
}*/

.button {
  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #AC7D0C;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
    .container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: teal;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 40px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color:  teal;
width: 100px;
}

.login_btn:hover{
color: black;
background-color:lightseagreen;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
.dropbtn {
  
  color: white;

  border: none;
}



.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {}
body{
    min-height:800px;
}
.minheight{
        min-height: 400px;
    }
    .table1{
        margin-top: 50px;
        margin-bottom:50px;
    }
    .sticky{
        
        position: sticky;
        top: 0;
        z-index: 70;
    }
    .bottom-shadow
    {
        box-shadow:0px 5px 10px black;
        
    }
    
  </style>
  <script>
    function Search( textboxid,tableid,recordcounttext) {
        var input, filter, table, tr, td, i;
        input = document.getElementById(textboxid);
        filter = input.value.toUpperCase();



        table = document.getElementById(tableid);
        tr = table.getElementsByTagName("tr");
        var noofrows = tr.length;
        var count = 0;
        for (i = 1; i <= noofrows - 1; i++) {
            var noofcols = tr[i].getElementsByTagName("td").length;
            var textdata = "";
            for (j = 0; j <= noofcols - 1; j++) {
                currenttd = tr[i].getElementsByTagName("td")[j];
                if (currenttd) {
                    textdata += currenttd.textContent || currenttd.innerText;
                }
            }
            //  alert(textdata);

            if (textdata.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
                count++;
            } else {
                tr[i].style.display = "none";
            }
        }
        document.getElementById(recordcounttext).value = count;
    } 
    </script>