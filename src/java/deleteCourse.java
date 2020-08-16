import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class deleteCourse extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int Courseid = Integer.parseInt(request.getParameter("Courseid"));

        try {

            ResultSet rs = DBLoader.executeQuery("select * from courses where Courseid=" + Courseid);
            if (rs.next()) {
                    rs.deleteRow();
                    out.println("Course deleted successfully");
            } else {
                out.println("course not found");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
