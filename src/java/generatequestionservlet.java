
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class generatequestionservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println(" <table   class=\"table table-responsive\">");
            int ind = Integer.parseInt(request.getParameter("ind"));
            int ind1 = ind;
            //////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////
            HttpSession session = request.getSession();
            question quesarray[] = (question[]) session.getAttribute("quesarray");
            int len=quesarray.length;
            if(ind==(len)){
                ind=0;
            }
            //////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////
            int question_id = (quesarray[ind].qid);
            String questiontitle = (quesarray[ind].questiontitle);
            String questionphotopath = (quesarray[ind].questionphotopath);
            String questiontype = (quesarray[ind].questiontype);
            String optionA = (quesarray[ind].optionA);
            String optionB = (quesarray[ind].optionB);
            String optionC = (quesarray[ind].optionC);
            String optionD = (quesarray[ind].optionD);
            String[] thisIsAStringArray = new String[4];
            thisIsAStringArray[0] = optionA;
            thisIsAStringArray[1] = optionB;
            thisIsAStringArray[2] = optionC;
            thisIsAStringArray[3] = optionD;
            int index = 0;
            String answer = (quesarray[ind].answer);
            int temp = ind + 1;
            out.println("<table class=\"table table-responsive\">  <thead><tr style='color: black;'><th><b>Question : "+temp+"</b></th></tr></thead>  ");
            out.println("<tbody>");
            out.println("<tr style='background-color : #FCF0E4;color : black;font-size : 17px;'><td><b>"+ questiontitle + "</b>");
               

            if (!(questiontype.equals("BOTH TYPES") || questiontype.equals("PHOTO TYPE QUESTION"))) {
                out.println("</td></tr>");
            } else {
                out.println("<br>" + "<img src=\""+questionphotopath+"\" class=\"img-responsive\" style=\"width: 400px; height: 300px\"  />" + "</td></tr>");
            }
//            out.println("<tr><td> (a)" + optionA + "</td></tr>");
//            out.println("<tr><td> (b)" + optionB + "</td></tr>");
//            out.println("<tr><td> (c)" + optionC + "</td></tr>");
//            out.println("<tr><td> (d)" + optionD + "</td></tr>");
//            out.println("</table");
//            out.println("<table style=\"margin-top: 20px;\"><tr>");
            
            if (quesarray[ind].useranswer != "") {
                for (char j = 'A'; j <= 'D'; j++) {
                    String gullu = j + "";
                    if (quesarray[ind].useranswer.equals(gullu)) {
                        out.println("<tr style='color: black;'><td>");
                        out.println(j + "<input type=\"radio\"   name=" + question_id + " value=" + gullu + "  checked=\"\" onclick=\"go6(this.value," + ind + ")\" />");
                        String LabelInput = thisIsAStringArray[index];
                        out.println("<label>" + LabelInput + "</label>");out.println("</td></tr>");
                        //out.println("<br>");
                        index++;
                    } else {
                        out.println("<tr style='color: black;'><td>");
                        out.println(j + "<input type=\"radio\"   name=" + question_id + " value=" + gullu + "  onclick=\"go6(this.value," + ind + ")\" />");
                        String LabelInput = thisIsAStringArray[index];
                        out.println("<label>" + LabelInput + "</label>");out.println("</td></tr>");
                        //out.println("<br>");
                        index++;
                    }
                }
//                out.println("</td>");
            } else {
                out.println("<tr style='color: black;'><td>");
                out.println("A<input type=\"radio\"   name=" + question_id + " value=\"A\" onclick=\"go6(this.value," + ind + ")\" />");
                out.println("<label>" + optionA + "</label>");
                out.println("</td></tr>");
                //out.println("<br>");
                out.println("<tr style='color: black;'><td>");
                out.println("B<input type=\"radio\"   name=" + question_id + " value=\"B\" onclick=\"go6(this.value," + ind + ")\" /> ");
                out.println("<label>" + optionB + "</label>");
                out.println("</td></tr>");
                //out.println("<br>");
                out.println("<tr style='color: black;'><td>");
                out.println("C<input type=\"radio\"   name=" + question_id + " value=\"C\" onclick=\"go6(this.value," + ind + ")\" />");
                out.println("<label>" + optionC + "</label>");
                out.println("</td></tr>");
                //out.println("<br>");
                out.println("<tr style='color: black;'><td>");
                out.println("D<input type=\"radio\"   name=" + question_id + " value=\"D\" onclick=\"go6(this.value," + ind + ")\" />");
                out.println("<label>" + optionD + "</label>");
                out.println("</td></tr>");
                //out.println("<br>");
            }
            out.println("<tbody>");
            out.println("</table>");
            out.println("<div id=\"unselect\" ><a  id=\"s3\" onclick=\"unselect(" + ind + ")\"> <button class=\"btn btn-info\">Clear Response</button></a></div>");
//            for (int i = 0; i < 20; i++) {
//                int m = i + 1;
//                if (quesarray[i].useranswer != null) {
//                    out.println("<input type=\"button\" class=\"\" value=" + m + " onclick=\"def(this.value)\" style=\"background-color: #ffff33\"/>");
//                } else {
//                    out.println("<input type=\"button\" value=" + m + " onclick=\"def(this.value)\" class=\"btn-danger\"/>");
//                    
//
//                }
//            }
            out.println("<br><div class=\"\">");
            out.println("<a  onclick=\"go4(" + ind + ")\"><label style='background-color: #FF6700;height: 50px;width: 50px;border-radius: 50%;'><span class='glyphicon glyphicon-arrow-left' style='color: white;padding: 16px;'></span></label></a>");
            out.println("<a style=\"padding-left: 854px\"  onclick=\"go5(" + ind + ")\"><label style='background-color: #FF6700;height: 50px;width: 50px;border-radius: 50%;'><span class='glyphicon glyphicon-arrow-right' style='color: white;padding: 16px;'></span></label></a></div>");
            out.println("</table");
        } catch (Exception ex) {
            ex.printStackTrace();
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
