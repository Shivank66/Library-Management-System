package loginpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginManager {
    private static String loginpage = "loginmodal.jsp",homepage="Index.jsp",logoutpage="logout.jsp";
    public static boolean doLogout(HttpServletResponse response,HttpSession session)
    {
        try
        {
            session.invalidate();
            response.sendRedirect(loginpage);
            return true;
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
    public static boolean protectPage(HttpServletResponse response,HttpSession session)
    {
        try
        {
            if(isUserLoggedIn(session))
                return true;
            response.sendRedirect(loginpage);
            return false;
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
    
    public static String getCurrentUser(HttpSession session)
    {
        try
        {
             if(session.getAttribute("username")==null)
                 return "";
             else 
                 return "" + session.getAttribute("username");
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return "";
        }
    }
    public static boolean isUserLoggedIn(HttpSession session)
    {
        try
        {
            if(session.getAttribute("username")==null)
                return false;
            else 
                return true;
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
    
    public static boolean doLogin(String siteusername,String password,HttpSession session, HttpServletResponse response)
    {
        try
        {
            boolean b=isUserNameAndPasswordCorrect(siteusername, password, session);
            if(!b)
                return false;
            session.setAttribute("siteusername", siteusername);
            response.sendRedirect(homepage);
            return true;
            
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
    
    public static boolean isUserNameAndPasswordCorrect(String username,String password,HttpSession session)
    {
        try
        {
            PreparedStatement ps=DbConfig.getPreparedStatement("select * from login where username=? and password=?", session);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
                return true;
            else 
                return false;
            
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
}



