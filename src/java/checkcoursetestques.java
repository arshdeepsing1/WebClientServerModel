
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

public class checkcoursetestques extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String email = session.getAttribute("userEmail").toString();
        System.out.println(email);
        String rid=request.getParameter("rid");
        String empty="";
        {
             String mainjson = new RDBMS_TO_JSON().generateJSON("select * from quesresult,questions where email='"+email+"' and quesresult.qid=questions.qid and rid='"+rid+"'");
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
