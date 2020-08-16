
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import vmm.*;

public class addreply extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;");
        PrintWriter out = response.getWriter();
        // HttpSession session=request.getSession();
        String four = request.getParameter("four");
        String five = request.getParameter("five");
        String y = request.getParameter("y");
        try {
            ResultSet rs = DBLoader.executeQuery("select * from userquery where tq='" + five + "' ");

            if (rs.next()) {
                String a = rs.getString("name");
                String b = rs.getString("eaddress");
                String c = rs.getString("subject");
                String d = rs.getString("message");
                rs.updateString("name", a);
                rs.updateString("eaddress", b);
                rs.updateString("subject", c);
                rs.updateString("message", d);
                rs.updateString("flag", y);
                rs.updateRow();
                //String p = rs.getString("Password");
                SimpleMailDemo obj = new SimpleMailDemo(b, "Reply", four);
                obj.sendemail();
                out.println("reply sent  to " + b);
            } else {
                out.println("reply not sent");
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
