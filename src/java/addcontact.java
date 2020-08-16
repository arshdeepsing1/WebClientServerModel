
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import vmm.*;

public class addcontact extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;");
        PrintWriter out = response.getWriter();
        // HttpSession session=request.getSession();
        String one = request.getParameter("_one");
        System.out.println(one);
        String two = request.getParameter("_two");
        System.out.println(two);
        String three = request.getParameter("_three");
        System.out.println(three);
        String four = request.getParameter("_four");
        System.out.println(four);
        try {
            ResultSet rs = DBLoader.executeQuery("select * from userquery");
            
            rs.moveToInsertRow();
            rs.updateString("name", one);
            rs.updateString("eaddress", two);
            rs.updateString("subject", three);
            rs.updateString("message", four);
            rs.updateString("flag", "1");
            rs.updateString("flagone", "new");
            rs.insertRow();
            out.println("Query Sent");
            
           
            

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
