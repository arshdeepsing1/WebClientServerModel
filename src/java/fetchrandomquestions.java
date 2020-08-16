
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdk.nashorn.internal.parser.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import vmm.DBLoader;
import vmm.RDBMS_TO_JSON;

public class fetchrandomquestions extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        ArrayList<question> ques = new ArrayList();
        question[] quesarray = new question[10];

        String sid = request.getParameter("sid");
        String cid = request.getParameter("cid");
        
        try {
            ResultSet rs = DBLoader.executeQuery("select * from questions where Sectionid='" + sid + "'");
            while (rs.next()) {
                int qid = rs.getInt("qid");
                String questiontitle = rs.getString("quesTitle");
                String questionphotopath = rs.getString("quesImage");
                String optionA = rs.getString("opA");
                String optionB = rs.getString("opB");
                String optionC = rs.getString("opC");
                String optionD = rs.getString("opD");
                String answer = rs.getString("answer");
                String questiontype = rs.getString("quesType");
                ques.add(new question(qid, answer, optionA, optionB, optionC, optionD, questiontype, questionphotopath, questiontitle));
            }

            int ids[] = new int[10];
            for (int i = 0; i < 10;) {
                int flag = 0;
                int random = (int) (0 + (ques.size() - 0) * Math.random());
                int question_id = ques.get(random).qid;
                for (int p = i; p >= 0; p--) {

                    if (ids[p] == question_id) {

                        flag = 1;
                    }
                }
                if (flag == 0) {

                    ids[i] = question_id;
                    i++;
                }
            }

            JSONObject ansobject = new JSONObject();
            JSONArray jsonArray = new JSONArray();
            int c = 0;
            for (int n = 0; n < ids.length; n++) {
                int idsqid = ids[n];
                for (int m = 0; m < ques.size(); m++) {
                    int question_id = ques.get(m).qid;

                    if (idsqid == question_id) {
                        int qid = ques.get(m).qid;
                        String questiontitle = ques.get(m).questiontitle;
                        String questionphotopath = ques.get(m).questionphotopath;
                        String optionA = ques.get(m).optionA;
                        String optionB = ques.get(m).optionB;
                        String optionC = ques.get(m).optionC;
                        String optionD = ques.get(m).optionD;
                        String answer = ques.get(m).answer;
                        String questiontype = ques.get(m).questiontype;
                        JSONObject singlerow = new JSONObject();
                        singlerow.put("qid", qid);
                        singlerow.put("questiontitle", questiontitle);
                        singlerow.put("questionphotopath", questionphotopath);
                        singlerow.put("optionA", optionA);
                        singlerow.put("optionB", optionB);
                        singlerow.put("optionC", optionC);
                        singlerow.put("optionD", optionD);
                        singlerow.put("answer", answer);
                        singlerow.put("questiontype", questiontype);
                        quesarray[c] = new question(qid, answer, optionA, optionB, optionC, optionD, questiontype, questionphotopath, questiontitle);
                        c = c + 1;
                        jsonArray.add(singlerow.toJSONString());
                    }
                }
            }
            ansobject.put("ans", jsonArray);
            HttpSession session = request.getSession();
            session.setAttribute("quesarray", quesarray);
            session.setAttribute("Sectionid", sid);
            session.setAttribute("Courseid", cid);
            
            response.sendRedirect("./generatequestionservlet?ind=" + 0);
            //out.println(ansobject);
        } catch (Exception e) {
            e.printStackTrace();
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
