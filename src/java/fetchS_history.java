import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vmm.RDBMS_TO_JSON;
public class fetchS_history extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = session.getAttribute("userEmail").toString();
        String mainjson = new RDBMS_TO_JSON().generateJSON("select rid,Email,marksscored,finalresult,result.Sectionid,result.Courseid,testDate,cname,sname,courses.icon as c,sections.icon as s from result,courses,sections where Email='"+email+"' and result.Courseid=courses.Courseid and result.Sectionid=sections.Sectionid;");
        out.println(mainjson);
        
        
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