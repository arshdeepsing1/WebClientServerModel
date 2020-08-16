
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
public class editCategory extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String Courseid=request.getParameter("cidedit");
        String cname=request.getParameter("cnameedit");
        String cdesc=request.getParameter("cdescedit");
  

        try {
            ResultSet rs = DBLoader.executeQuery("select * from Courses  where Courseid='" + Courseid+"'");
            if (rs.next()) {
                 Collection<Part> parts = request.getParts();
                String ans = "";

                String absolutepath = request.getServletContext().getRealPath("/my_uploaded_files");
                System.out.println(absolutepath);

                String newfilename = new Date().getTime() + ".jpg";
                for (Part part : parts) {
                  String filename = FileUploader.savefileonserver(part, absolutepath, newfilename);
                    if (filename.equals("not-a-file")) {
                        ans += "<br>" + "This is not file....This is some text data";
                    } else {
                        ans += "<br>" + filename;
                    }
                }
       
                
                rs.updateString("cname", cname);
                rs.updateString("descript", cdesc);
            
                rs.updateString("icon","my_uploaded_files/"+newfilename);
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
