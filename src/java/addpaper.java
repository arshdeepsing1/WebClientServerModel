
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.*;
import java.sql.*;
import java.util.Collection;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import vmm2.FileUploader;

@MultipartConfig
public class addpaper extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String paper = request.getParameter("fileOK");
            int course1= Integer.parseInt(request.getParameter("course1"));
            ResultSet rs = DBLoader.executeQuery("select * from papers where paperTitle='" + paper + "'");
            if (!(rs.next())) {
                Collection<Part> parts = request.getParts();
                String ans = "";

                String absolutepath = request.getServletContext().getRealPath("/papers");
                System.out.println(absolutepath);

                String newfilename = new java.util.Date().getTime() + ".pdf";
                for (Part part : parts) {
                    String filename = FileUploader.savefileonserver(part, absolutepath, newfilename);
                    if (filename.equals("not-a-file")) {
                        ans += "<br>" + "This is not file....This is some text data";
                    } else {
                        ans += "<br>" + filename;
                    }
                }

                rs.moveToInsertRow();
                rs.updateString("paperTitle", paper);
                rs.updateString("filepath", "papers/" + newfilename);
                rs.updateInt("Courseid", course1);
                rs.insertRow();
                out.println("success");
            } else {
                out.println("failed");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
