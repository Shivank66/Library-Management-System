<%
if(request.getAttribute("n")==null)
{
   // RequestDispatcher dispatcher=request.getRequestDispatcher("numberentry.jsp");
   // dispatcher.forward(request, response);
    out.println("Number not found");
}
else
{
    int n=Integer.parseInt("" + request.getAttribute("n"));
    if(n%2==0)
    {
        RequestDispatcher dispatcher=request.getRequestDispatcher("even.jsp");
    dispatcher.forward(request, response);
    }
    else
    {
        RequestDispatcher dispatcher=request.getRequestDispatcher("odd.jsp");
    dispatcher.forward(request, response);
    }
}

%>