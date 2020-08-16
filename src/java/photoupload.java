
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import vmm2.FileUploader;

@MultipartConfig
public class photoupload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String email = session.getAttribute("userEmail").toString();
            ResultSet rs = DBLoader.executeQuery("select * from users where Email='" + email + "'");
            if (rs.next()) {
                Collection<Part> parts = request.getParts();
                String ans = "";

                String absolutepath = request.getServletContext().getRealPath("/profilephoto");
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
                rs.updateString("Userphoto", "profilephoto/"+newfilename);
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
