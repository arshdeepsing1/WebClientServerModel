
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
public class addquestion extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String cid = request.getParameter("course");
            String sid = request.getParameter("h1");
            String quesTitle = request.getParameter("quesTitle");
            String quesType = request.getParameter("quesType");
            String opA = request.getParameter("opA");
            String opB = request.getParameter("opB");
            String opC = request.getParameter("opC");
            String opD = request.getParameter("opD");
            String answer = request.getParameter("answer");
            String Explanation = request.getParameter("Explanation");
            System.out.println("cid " + cid + " sid " + sid + " questitle  " + quesTitle + " qtitle " + quesType + " apA " + opA + " opB " + opB + "opC " + opC + "opD " + opD + " answer " + answer + " Explanation " + Explanation);
            ResultSet rs = DBLoader.executeQuery("select * from questions  ");
            if (rs.next()) {
                Collection<Part> parts = request.getParts();
                String ans = "";

                String absolutepath = request.getServletContext().getRealPath("/my_uploaded_files");
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

                rs.moveToInsertRow();

                rs.updateString("quesTitle", quesTitle);

                rs.updateString("quesType", quesType);
                if (quesType.equals("PHOTO TYPE QUESTION") || quesType.equals("BOTH TYPES")) {
                    rs.updateString("quesImage", "my_uploaded_files/" + newfilename);
                }
                rs.updateString("opA", opA);
                rs.updateString("opB", opB);
                rs.updateString("opC", opC);
                rs.updateString("opD", opD);
                rs.updateString("Sectionid", sid);
                rs.updateString("answer", answer);
                rs.updateString("Explanation", Explanation);
                
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
