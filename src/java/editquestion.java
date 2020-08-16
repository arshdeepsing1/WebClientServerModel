
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
public class editquestion extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String quesTitle = request.getParameter("quesTitle1");
        String opA = request.getParameter("opA1");
        String opB = request.getParameter("opB1");
        String opC = request.getParameter("opC1");
        String opD = request.getParameter("opD1");
        String answer = request.getParameter("answer1");
        String qid = request.getParameter("qid1");
        String Explanation = request.getParameter("Explanation1");
        System.out.println(qid);
        try {
            ResultSet rs = DBLoader.executeQuery("select * from questions where qid='" + qid + "'");
            if (rs.next()) {
                Collection<Part> parts = request.getParts();
                String ans = "";
//                ans += "alert('100')";
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
                String quesType = rs.getString("quesType");
                rs.updateString("quesType", quesType);
                rs.updateString("quesTitle", quesTitle);
                rs.updateString("opA", opA);
                rs.updateString("opB", opB);
                rs.updateString("opC", opC);
                rs.updateString("opD", opD);
                rs.updateString("answer", answer);
                rs.updateString("Explanation", Explanation);
                if (quesType.equals("PHOTO TYPE QUESTION") || quesType.equals("BOTH TYPES")) {
                    rs.updateString("quesImage", "my_uploaded_files/" + newfilename);
                }
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
