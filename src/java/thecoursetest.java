
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import vmm.DBLoader;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class thecoursetest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String email = session.getAttribute("userEmail").toString();
        String cid = session.getAttribute("Courseid").toString();
        String todayTest = "";
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        System.out.println(dtf.format(now));
        todayTest = dtf.format(now);

        int rid = 0;
        int cid1 = 0;
        int correct = 0;
        int incorrect = 0;
        int unattempt = 0;
        try {
            cid1 = Integer.parseInt(cid);
        } catch (NumberFormatException e) {

        }

        try (PrintWriter out = response.getWriter()) {
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //out.println(" <table   class=\"table table-responsive table-hover\">");
            //out.println("<thead class='bg-primary'><tr><th>question</th><th>your answer</th><th>correct answer</th><th></th><th></th></tr></thead>");
            //out.println("<tbody>");
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
                } else if (qwe.equals("")) {
                    qwe = "";
                } else {

                }
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                if (quesarray[i].useranswer != "") {
                    System.out.println("----attemted logic---------" + i);
                    if (quesarray[i].useranswer.equals(quesarray[i].answer)) {
                        Totalmarks += 3;
                        //System.out.println("correct");
                        correct++;
                        //out.println("<tr><td>" + questiontitle + "</td><td>" + qwe + "</td><td>" + answer + "</td><td><span class=\"glyphicon glyphicon-ok-sign\" style=\"color : green;\"></span></td><td>+3</td></tr>");
                    } else {
                        //out.println("<tr><td>" + questiontitle + "</td><td>" + qwe + "</td><td>" + answer + "</td><td><span class=\"glyphicon glyphicon-remove-sign\" style=\"color : red;\"></td><td>0</td></tr>");
                        incorrect++;
                        Totalmarks -= 1;
//                        System.out.println("incorrect");
//                        System.out.println("totalmarks " + Totalmarks);
                    }
                } else {
                    System.out.println("-----------------------------------unattemted logic---------" + i);
                    if (quesarray[i].useranswer == "") {
                        //System.out.println("unattemted logic---------" + i);
                        //out.println("<tr><td>" + questiontitle + "</td><td>" + qwe + "</td><td>" + answer + "</td><td><span class=\"glyphicon glyphicon-ban-circle\"></td><td>Nil</td></tr>");
                        unattempt++;
                    }
                }
            }
            ////////////////////////////////////////////////////////////////////
            //System.out.println("totalmarks " + Totalmarks);
            //out.println("</tbody>");
            //out.println("</table>");
            //int percent = 0;
            //percent = (Totalmarks / 50) * 100;
            ////////////////////////////////////////////////////////////////////
            if (Totalmarks >= 9) {
                result = "PASS";
                status = "placed";
            } else {
                result = "FAIL";
                status = "unplaced";
            }
            /////////////FOR FINDING PERCENTAGE///////////////////////////////////////////////////////////// 
//            int percent = 0;
//            percent = (Totalmarks * 100) / 50;
//            System.out.println(percent);
//            String alpha = Integer.toString(percent);
//            String delta = Integer.toString(Totalmarks);
//            
//            String qwerty1 = Integer.toString(correct);
//            String qwerty2 = Integer.toString(incorrect);
//            String qwerty3 = Integer.toString(unattempt);
            ////////////////////////////////////////////////////////////////////////////////////////////////////

//            out.println("<label id=\"tellpercent\" class=\"hidden\" value=\"" + alpha + "\">" + alpha + "</label>");
//            out.println("<label id=\"tellmarks\" class=\"hidden\" value=\"" + delta + "\">" + delta + "</label>");
//            out.println("<label id=\"tellresult\" class=\"hidden\" value=\"" + result + "\">" + result + "</label>");
//            
//            out.println("<label id=\"piechart1\" class=\"hidden\" value=\"" + qwerty1 + "\">" + qwerty1 + "</label>");
//            out.println("<label id=\"piechart2\" class=\"hidden\" value=\"" + qwerty2 + "\">" + qwerty2 + "</label>");
//            out.println("<label id=\"piechart3\" class=\"hidden\" value=\"" + qwerty3 + "\">" + qwerty3 + "</label>");
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//            out.println("<div class='well'>");
//            out.println("<div id=\"myProgress\" style=\"width: 100%;\n"
//                    + "  background-color: #ddd;\">\n"
//                    + "  <div id=\"myBar\" style=\"width: " + percent + "%;\n"
//                    + "  height: 30px;\n"
//                    + "  background-color: #4CAF50;\"></div>\n"
//                    + "</div>");
//            out.println("</div>");
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            out.println("success");
            ResultSet rs = DBLoader.executeQuery("select * from result");
            rs.moveToInsertRow();
            rs.updateInt("marksscored", Totalmarks);
            rs.updateString("finalresult", result);
            rs.updateString("Email", email);
            rs.updateInt("Courseid", cid1);
            rs.updateString("testDate", todayTest);
            rs.insertRow();

            ResultSet rs1 = DBLoader.executeQuery("select * from result ORDER BY rid DESC");
            while (rs1.next()) {
                rid = rs1.getInt("rid");
                System.out.println(rid);
                break;
            }
            session.setAttribute("rid", rid);
            session.setAttribute("c", cid);
            String zedd="1";
            session.setAttribute("tell", zedd);
            for (int k = 0; k < 10; k++) {
                String optionA = (quesarray[k].optionA);
                String optionB = (quesarray[k].optionB);
                String optionC = (quesarray[k].optionC);
                String optionD = (quesarray[k].optionD);
                String answer = (quesarray[k].answer);
                String z = "";
                if (answer.equals("A")) {
                    z += optionA;
                } else if (answer.equals("B")) {
                    z += optionB;
                } else if (answer.equals("C")) {
                    z += optionC;
                } else if (answer.equals("D")) {
                    z += optionD;
                }
                String qwe = (quesarray[k].useranswer);
                String qw = "";
                if (qwe.equals("A")) {
                    qwe = optionA;
                    qw += "(A)";
                } else if (qwe.equals("B")) {
                    qwe = optionB;
                    qw += "(B)";
                } else if (qwe.equals("C")) {
                    qwe = optionC;
                    qw += "(C)";
                } else if (qwe.equals("D")) {
                    qwe = optionD;
                    qw += "(D)";
                } else if (qwe.equals("")) {
                    qwe = "";
                    qw += "";
                } else {

                }
                ResultSet as = DBLoader.executeQuery("select * from quesresult");
                as.moveToInsertRow();

                as.updateInt("rid", rid);
                as.updateString("quesTitle", quesarray[k].questiontitle);
                if (quesarray[k].questiontype == "TEXT TYPE QUESTION") {

                } else {
                    as.updateString("quesImage", quesarray[k].questionphotopath);
                }
                as.updateInt("qid", quesarray[k].qid);
                String world1="<b>["+quesarray[k].answer+"]</b>  "+z;
                as.updateString("correctanswer", world1);
                String world2="<b>["+quesarray[k].useranswer+"]</b>  "+qwe;
                if((quesarray[k].useranswer).equals("")){
                    world2="";
                }
                as.updateString("useranswer", world2);
                as.updateString("Email", email);
                as.insertRow();

            }

            //out.println("<div style=\"border-radius :20px 20px 0px 0px;background-color: yellow;\"><label><h3><b>RESULT STATUS : "+result+"  MARKS SCORED : "+Totalmarks+"</b></h3><label></div>");
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
