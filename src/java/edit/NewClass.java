import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import vmm.DBLoader;

public class NewClass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String email = session.getAttribute("email").toString();

        try (PrintWriter out = response.getWriter()) {
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            out.println(" <table   class=\"table table-responsive\">");
            out.println("<thead class='bg-primary'><tr><th>question</th><th>your answer</th><th>correct answer</th></tr></thead>");
            out.println("<tbody class='bg-success'>");
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            int Totalmarks = 0;
            String result = "";
            String status = "";
            question quesarray[] = (question[]) session.getAttribute("quesarray");
            for (int i = 0; i < 10; i++) {
                int m = i + 1;

                
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                int question_id = (quesarray[i].qid);
                String questiontitle = (quesarray[i].questiontitle);
                String questionphotopath = (quesarray[i].questionphotopath);
                String questiontype = (quesarray[i].questiontype);
                String optionA = (quesarray[i].optionA);
                String optionB = (quesarray[i].optionB);
                String optionC = (quesarray[i].optionC);
                String optionD = (quesarray[i].optionD);
                String answer = (quesarray[i].answer);
                String qwe = (quesarray[i].useranswer);
                if (qwe.equals("A")) {
                    qwe = optionA;
                } else if (qwe.equals("B")) {
                    qwe = optionA;
                } else if (qwe.equals("C")) {
                    qwe = optionA;
                } else if (qwe.equals("D")) {
                    qwe = optionA;
                } else {
                    qwe = "";
                }
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                if (quesarray[i].useranswer != null) {
                    System.out.println("----attemted logic---------" + i);
                    if (quesarray[i].useranswer.equals(quesarray[i].answer)) {
                        Totalmarks += 5;
                        System.out.println("correct");
                        out.println("<tr><td>" + questiontitle + "</td><td>" + qwe + "</td><td>" + answer + "</td><td><span class=\"glyphicon glyphicon-ok-sign\"></span></td></tr>");
                    } else {
                        out.println("<tr><td>" + questiontitle + "</td><td>" + qwe + "</td><td>" + answer + "</td><td><span class=\"glyphicon glyphicon-remove-sign\"></td></tr>");

                    }
                } else {
                    System.out.println("-----------------------------------unattemted logic---------" + i);
                    if (quesarray[i].useranswer == null) {
                        System.out.println("unattemted logic---------" + i);
                        out.println("<tr><td>" + questiontitle + "</td><td>" + qwe + "</td><td>" + answer + "</td><td><span class=\"glyphicon glyphicon-ban-circle\"></td></tr>");

                    }
                }

            }
            ////////////////////////////////////////////////////////////////////
            out.println("</tbody>");
            int percent;
            percent = (Totalmarks / 50) * 100;
            ////////////////////////////////////////////////////////////////////
            if (Totalmarks >= 31) {
                result = "pass";
                status = "placed";
            } else {
                result = "fail";
                status = "unplaced";
            }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            out.println("<div class='well'>");
            out.println(" <div class=\"progress\">\n"
                    + "    <div class=\"progress-bar\" role=\"progressbar\" aria-valuenow=\"70\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width:"+percent+"%\">\n"
                    + "      <span class=\"sr-only\">70% Complete</span>\n"
                    + "    </div>\n"
                    + "  </div>");
            out.println("</div>");
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ResultSet rs = DBLoader.executeQuery("select * from result where Email='" + email + "'  ");

            if (rs.next()) {

                rs.updateInt("marksscored", Totalmarks);
                rs.updateString("finalresult", result);
                rs.updateString("Email", email);

                rs.updateRow();
                out.println("Result    " + result + "    Totalmarks :-" + Totalmarks);

            } else {
                rs.moveToInsertRow();
                rs.updateInt("marksscored", Totalmarks);
                rs.updateString("finalresult", result);
                rs.updateString("Email", email);

                rs.insertRow();
                out.println("Result     " + result + "    Totalmarks :-" + Totalmarks);
            }
            out.println("</table>");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
