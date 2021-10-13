package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dbpackage.Dbconfig;
import dbpackage.Account;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    int account=0;
    
    
    String result="",butt="";
    String check=request.getParameter("check");
    boolean empty=true;
    if(check==null)
        empty=false;
    if(empty)
    {
    butt=request.getParameter("cmd");
    
    if(butt.equals("btn"))
    {
        try{
    account=Integer.parseInt(request.getParameter("acc"));
    Account a=new Account(account);
    result=""+a;
    }
    catch(Exception ex){
        result="exception";
        System.out.println(ex);
        
    }}}
    //System.out.println(a);
   
    
    
    
    
    
     
    
    
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Bank yahin Banega</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <form action=\"openAcc.jsp\" method=\"post\">\n");
      out.write("        <label for=\"Name\">Your Name:  </label>\n");
      out.write("        <input type=\"text\" id=\"Name\" name=\"Name\" placeholder=\"Name\">\n");
      out.write("        <label for=\"amount\">Initial deposit: </label>\n");
      out.write("        <input type=\"number\" name=\"amount\" id=\"amount\" placeholder=\"amount\">\n");
      out.write("        <input type=\"submit\" value=\"submit\">\n");
      out.write("      </form>\n");
      out.write("`\n");
      out.write("        \n");
      out.write("        <form action=\"search.jsp\" method=\"post\">\n");
      out.write("            <input type=\"hidden\" name=\"check\">\n");
      out.write("        <label for=\"acc\">Account No.</label>\n");
      out.write("        <input type=\"number\" id=\"acc\" name=\"acc\" placeholder=\"Account No.\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <button type=\"submit\" value=\"btn\" name=\"cmd\" id=\"cmd\">Submit</button>\n");
      out.write("        <div> \n");
      out.write("            <br>\n");
      out.write("            <h1>Aaja bhai</h1>\n");
      out.write("            ");
      out.print(result);
      out.write("\n");
      out.write("        </div>    \n");
      out.write("\n");
      out.write("      </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
