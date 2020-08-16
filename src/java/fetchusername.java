
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vmm.DBLoader;

public class fetchusername extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String value = request.getParameter("three");
        String y = request.getParameter("y");
        if (value.equals("")) {

        } else {
            if (y.equals("signup")) {
                try {
                    ResultSet rs = DBLoader.executeQuery("select * from users where Email='" + value + "'  ");

                    if (rs.next()) {
                        out.println("yes");
                    } else {
                        out.println("no");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                String q = request.getParameter("q");
                try {
                    ResultSet rs1 = DBLoader.executeQuery("select * from users where Email='" + q + "'  ");

                    if (rs1.next()) {
                        String a = rs1.getString("Email");
                        if (a.equals(value)) {
                            out.println("no");
                        } else {
                            ResultSet rs2 = DBLoader.executeQuery("select * from users where Email='" + value + "'  ");
                            if(rs2.next()){
                                out.println("yes");
                            }
                            else{
                                out.println("no");
                            }
                        }
                    } else {
                        out.println("no");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

//@Override
//        protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//        protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }


