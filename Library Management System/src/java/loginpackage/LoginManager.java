package loginpackage;

import dbpackage.DbConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
            response.sendRedirect(homepage);
            return false;
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
    public static String getCurrentUserType(HttpSession session)
    {
        try
        {
             if(session.getAttribute("usertype")==null)
                 return "";
             else 
                 return "" + session.getAttribute("usertype");
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return "";
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
            String usertypecheck=usertype(siteusername,session);
            session.setAttribute("usertype",usertypecheck );
            System.out.println(usertypecheck);
           
            
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
    public static String usertype(String siteusername,HttpSession session) throws SQLException
    {
        try{
        PreparedStatement ps=DbConfig.getPreparedStatement("select usertype from usertypes u join siteusers s on u.usertypeno=s.usertypeno where siteusername=?", session);
        ps.setString(1, siteusername);
         ResultSet rs=ps.executeQuery();
            if(rs.next())
                return rs.getObject(1)+"";
            else 
                return "";
            
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return "";
        }
    }    
    
    
    
}



