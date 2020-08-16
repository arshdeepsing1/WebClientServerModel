
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
import javax.servlet.http.Part;
import vmm.DBLoader;
import vmm2.FileUploader;

@MultipartConfig
public class adduser extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
  

        try {
            ResultSet rs = DBLoader.executeQuery("select * from users where Email='" + request.getParameter("email")+"'");
            if (rs.next()) {
                out.println("already exists");
            } else {
//                Collection<Part> parts = request.getParts();
//                String ans = "";
//
//                String absolutepath = request.getServletContext().getRealPath("/my_uploaded_files");
//                System.out.println(absolutepath);
//
//                String newfilename = new Date().getTime() + ".jpg";
//                for (Part part : parts) {
//                  String filename = FileUploader.savefileonserver(part, absolutepath, newfilename);
//                    if (filename.equals("not-a-file")) {
//                        ans += "<br>" + "This is not file....This is some text data";
//                    } else {
//                        ans += "<br>" + filename;
//                    }
//                }
                
                
                String fullname = request.getParameter("fullname");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String username= request.getParameter("email");
                String phone= request.getParameter("phone");
                
                rs.moveToInsertRow();
                
                rs.updateString("Fullname", fullname);
                rs.updateString("Email", email);
                rs.updateString("Password", password);
                rs.updateString("Username", username);
                rs.updateString("Userphoto", "images/user.jpg");
                 rs.updateString("Userphone", phone);
                rs.insertRow();
                
                out.println("success");
                

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
