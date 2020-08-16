import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class deletequery extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("tq"));

        try {

            ResultSet rs = DBLoader.executeQuery("select * from userquery where tq=" + id);
            if (rs.next()) {
                    rs.deleteRow();
                    out.println("deleted successfully");
            } else {
                out.println("deletion failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
