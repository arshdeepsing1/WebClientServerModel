
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.*;
import vmm2.*;

public class changepass extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String Username = session.getAttribute("Username").toString();
        String opass = request.getParameter("opass");
        String npass = request.getParameter("npass");

        try {

            ResultSet rs = DBLoader.executeQuery("select * from admin where Username='" + Username + "' and Password='" + opass + "' ");

            System.out.println("resultset created");

            if (rs.next()) {
                rs.updateString("Password", npass);
                rs.updateRow();
                out.println("success");
            } else {
                out.println("failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
