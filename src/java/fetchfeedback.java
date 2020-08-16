
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
import vmm.RDBMS_TO_JSON;
import vmm2.FileUploader;

@MultipartConfig
public class fetchfeedback extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String comment = request.getParameter("qwerty");
        if (comment.equals("left")) {
            String mainjson1 = new RDBMS_TO_JSON().generateJSON("select avg(rating),c_Name,s_Name from feedback  where s_Name in (select s_Name from feedback where s_Name='nil') group by c_Name");
            out.println(mainjson1);
        } else if (comment.equals("right")) {
            String mainjson2 = new RDBMS_TO_JSON().generateJSON("select avg(rating),c_Name,s_Name from feedback  where s_Name in (select s_Name from feedback where s_Name!='nil') group by s_Name");
            out.println(mainjson2);
        } else if (comment.equals("all")) {
            String mainjson3 = new RDBMS_TO_JSON().generateJSON("select * from feedback");
            out.println(mainjson3);
        } else {
            String mainjson4 = new RDBMS_TO_JSON().generateJSON("select * from feedback");
            out.println(mainjson4);
        }

    }

}
