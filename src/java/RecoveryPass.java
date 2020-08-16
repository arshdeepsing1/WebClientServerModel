import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import vmm.*;


public class RecoveryPass extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;");
            PrintWriter out = response.getWriter();
        // HttpSession session=request.getSession();
        String Username= request.getParameter("Username");
        try {
            ResultSet rs = DBLoader.executeQuery("select * from admin where Username='"+Username+"' ");
           
        


            if (rs.next()) {
             String a=rs.getString("Email");
             
             String p=rs.getString("Password");
             SimpleMailDemo  obj=new SimpleMailDemo(a, "Password", p);
             obj.sendemail();
                out.println("password sent  to "+a);
            } else {
                out.println("invalid username");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
   
}
