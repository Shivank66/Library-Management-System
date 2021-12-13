package loginpackage;
import bookpackage.ActivityLog;
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
            int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Logged Out",session);
            ob.save(session);
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
    public static String getCurrentSiteUserno(HttpSession session)
    {
        try
        {
             if(session.getAttribute("siteuserno")==null)
                 return "";
             else 
                 return "" + session.getAttribute("siteuserno");
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return "";
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
            return session.getAttribute("siteusername") != null;
        }
        catch(Exception ex)
        {
            System.err.println(ex);
            return false;
        }
    }
    public static boolean isUserClerk(HttpSession session) throws SQLException
    {
        return getCurrentUserType(session).equals("Clerk");
    }
    public static boolean isUserAdmin(HttpSession session) throws SQLException
    {
        return getCurrentUserType(session).equals("Admin");
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
            session.setAttribute("siteuserno", siteuserno(siteusername,session));
            System.out.println(usertypecheck);
           
            
            response.sendRedirect(homepage);
            int a=Integer.parseInt(LoginManager.getCurrentSiteUserno(session));
            ActivityLog ob=new ActivityLog(a,"Logged In",session);
            ob.save(session);
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
    public static String siteuserno(String siteusername,HttpSession session) throws SQLException
    {
        try{
        PreparedStatement ps=DbConfig.getPreparedStatement("select siteuserno from siteusers where siteusername=?", session);
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
    
    public static boolean protectPageAdmin(HttpServletResponse response,HttpSession session)
    {
        try
        {
            if(isUserLoggedIn(session) && isUserAdmin(session) )
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
    public static boolean protectPageAdminClerk(HttpServletResponse response,HttpSession session)
    {
        try
        {
            if(isUserLoggedIn(session) && (isUserAdmin(session)||isUserClerk(session))   )
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
    public static boolean protectPageClerk(HttpServletResponse response,HttpSession session)
    {
        try
        {
            if(isUserLoggedIn(session) && isUserClerk(session))
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
    
    
    
}



