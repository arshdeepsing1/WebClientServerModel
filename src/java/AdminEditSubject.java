
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
public class AdminEditSubject extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String cid = request.getParameter("cidedit");
            String sid = request.getParameter("sidedit");
            String sname = request.getParameter("snameedit");
            String sdesc = request.getParameter("sdescedit");
           
            ResultSet rs = DBLoader.executeQuery("select * from Sections where Sectionid='" + sid + "' and Courseid='" + cid + "' ");
            if (rs.next()) {
                Collection<Part> parts = request.getParts();
                String ans = "";

                String absolutepath = request.getServletContext().getRealPath("/myuploads");
                System.out.println(absolutepath);

                String newfilename = new java.util.Date().getTime() + ".jpg";
                for (Part part : parts) {
                    String filename = FileUploader.savefileonserver(part, absolutepath, newfilename);
                    if (filename.equals("not-a-file")) {
                        ans += "<br>" + "This is not file....This is some text data";
                    } else {
                        ans += "<br>" + filename;
                    }
                }

                rs.updateString("sname", sname);
                rs.updateString("sdescript", sdesc);

                rs.updateString("icon", "myuploads/" + newfilename);
                rs.updateRow();

                out.println("success");

            } else {
                out.println("failed");

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
