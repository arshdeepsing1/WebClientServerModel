
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;

public class thecourserank extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = session.getAttribute("userEmail").toString();
        //System.out.println(email);
        String cid=request.getParameter("Courseid");
        String empty="";
        {
             String mainjson = new RDBMS_TO_JSON().generateJSON("select rid,result.Email,marksscored,finalresult,Userphoto from result,users where Sectionid is null and Courseid='"+cid+"' and result.Email=users.Email order by marksscored desc"); 
             System.out.println(mainjson);
             out.println(mainjson);
        }
         
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
