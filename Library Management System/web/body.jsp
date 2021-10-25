<%@include file="header.jsp" %>  

<title>Boot Example</title>

</head>
<body>
    <div class="container-fluid">
    <%@include file="menu.jsp" %>
    
  <h2>Alerts</h2>
  <p>Alerts are created with the .alert class, followed by a contextual color classes:</p>
  <div class="alert alert-success">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Success!</strong> This alert box could indicate a successful or positive action.
  </div>
  <div class="alert alert-info">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Info!</strong> This alert box could indicate a neutral informative change or action.
  </div>
  <div class="alert alert-warning">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Warning!</strong> This alert box could indicate a warning that might need attention.
  </div>
  <div class="alert alert-danger">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Danger!</strong> This alert box could indicate a dangerous or potentially negative action.
  </div>
  <div class="alert alert-primary">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Primary!</strong> Indicates an important action.
  </div>
  <div class="alert alert-secondary">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Secondary!</strong> Indicates a slightly less important action.
  </div>
  <div class="alert alert-dark">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Dark!</strong> Dark grey alert.
  </div>
  <div class="alert alert-light">
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Light!</strong> Light grey alert.
  </div>
</div>
    <div> <%
            String a="<table class=\"table table-bordered\"> \n"+" <thead>"+"<tr>"+"\n<th>Firstname</th>"+"\n<th>Lastname</th>"+"\n<th>Email</th>"+"</tr>"+"</thead>"+"<tbody>"+"<tr>"+"<td>John</td>"+"<td>Doe</td>"+"<td>john@example.com</td>"+"</tr>"+"<tr>"+"<td>Mary</td>"+"<td>Moe</td>"+"<td>mary@example.com</td>"+"</tr>"+"<tr>"+"<td>July</td>"+"<td>Dooley</td>"+"<td>july@example.com</td>"+"</tr>"+"</tbody>"+"</table>";
      %></div>
      <div><%=a%></div>

<%@include file="footer.jsp" %>
</body>
</html>
