
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
public class editprofileSave extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = session.getAttribute("userEmail").toString();

        try {
            ResultSet rs = DBLoader.executeQuery("select * from users where Email='" + email + "'");
            if (rs.next()) {
                String fullname = request.getParameter("fullnameEDIT");
                String email1 = request.getParameter("emailEDIT");
                String password = request.getParameter("passwordEDIT");
                String username = request.getParameter("emailEDIT");
                String phone = request.getParameter("phoneEDIT");
                session.setAttribute("userEmail", email1);
                session.setAttribute("userFullname", fullname);
                rs.updateString("Fullname", fullname);
                rs.updateString("Email", email1);
                rs.updateString("Password", password);
                rs.updateString("Username", username);
                rs.updateString("Userphone", phone);
                rs.updateRow();

                out.println("success");

            } else {

                out.println("already exists");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
