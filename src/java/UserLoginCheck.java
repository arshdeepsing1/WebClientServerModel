
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

public class UserLoginCheck extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;");
        PrintWriter out = response.getWriter();

        String Username = request.getParameter("Username");
        String Password = request.getParameter("Password");

        try {

            ResultSet rs = DBLoader.executeQuery("select * from users where Username='" + Username + "' and Password='" + Password + "' ");
            System.out.println("resultset created");

            if (rs.next()) {
                HttpSession session = request.getSession();
                String getfullname = rs.getString("fullname");
                session.setAttribute("userEmail", Username);
                session.setAttribute("userFullname", getfullname);
                out.println("success");
            } else {
                out.println("failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
