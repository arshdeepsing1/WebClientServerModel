
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm2.FileUploader;

@MultipartConfig
public class addfeedback extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = session.getAttribute("userEmail").toString();
        String rid = session.getAttribute("rid").toString();
        String test = session.getAttribute("tell").toString();
        String x = null;
        String y = null;
        String c = null;
        String s = null;
        int c1 = 0;
        int s1 = 0;
        if (test.equals("1")) {
            c = session.getAttribute("c").toString();
            c1 = Integer.parseInt(c);
        } else {
            c = session.getAttribute("c").toString();
            c1 = Integer.parseInt(c);
            s = session.getAttribute("s").toString();
            s1 = Integer.parseInt(s);
        }
        String comment = request.getParameter("comment");
        String rating = request.getParameter("d");

        if (test.equals("1")) {
            try {
                ResultSet rs1 = DBLoader.executeQuery("select * from courses where Courseid='" + c + "'");
                while (rs1.next()) {
                    String cName = rs1.getString("cname");
                    x = cName;
                    y = "nil";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (test.equals("12")) {
            try {
                ResultSet rs2 = DBLoader.executeQuery("select * from courses where Courseid='" + c + "'");
                while (rs2.next()) {
                    String cName = rs2.getString("cname");
                    x = cName;
                }
                ResultSet rs3 = DBLoader.executeQuery("select * from sections where Sectionid='" + s + "'");
                while (rs3.next()) {
                    String sName = rs3.getString("sname");
                    y = sName;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {

        }
        String date = null;
        try {
            ResultSet rs4 = DBLoader.executeQuery("select * from result where rid='" + rid + "'");
            while (rs4.next()) {
                date = rs4.getString("testDate");
            }
            ResultSet rs = DBLoader.executeQuery("select * from feedback");
            rs.moveToInsertRow();
            rs.updateString("rid", rid);
            rs.updateString("comment", comment);
            rs.updateString("rating", rating);
            rs.updateString("Email", email);
            rs.updateString("c_Name", x);
            rs.updateString("s_Name", y);
            rs.updateString("testdate", date);
            rs.insertRow();
            out.println("success");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
