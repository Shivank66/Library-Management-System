package loginpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginManager {
    private static String loginpage = "Homepage.jsp",homepage="Homepage.jsp",logoutpage="Homepage.jsp";
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
             if(session.getAttribute("siteusername")==null)
                 return "";
             else 
                 return "" + session.getAttribute("siteusername");
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
            if(session.getAttribute("siteusername")==null)
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
    
    public static boolean isUserNameAndPasswordCorrect(String siteusername,String password,HttpSession session)
    {
        try
        {
            PreparedStatement ps=DbConfig.getPreparedStatement("select * from siteusers where siteusername=? and password=?", session);
            ps.setString(1, siteusername);
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



