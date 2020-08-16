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

@MultipartConfig
public class addsection extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String cid= request.getParameter("cid");
            String sname = request.getParameter("sname");
            String sdesc = request.getParameter("sdesc");

           
                ResultSet rs = DBLoader.executeQuery("select * from sections where  Courseid='"+cid+"' and sname='" + sname + "' ");
                if (rs.next()) {
                    out.println("failed");
                } else {

                    Collection<Part> parts = request.getParts();
                    String fn[] = new String[100];
                    String absolutepath = request.getServletContext().getRealPath("/myuploads");

                    int i = 0;
                    for (Part part : parts) {
                        String Filename = vmm2.FileUploader.savefileonserver(part, absolutepath);

                        if (!Filename.equals("not-a-file")) {
                            fn[i] = "myuploads/" + Filename;
                            i++;
                        }
                    }
                    rs.moveToInsertRow();

                    rs.updateString("Courseid", cid);
                    rs.updateString("sname", sname);
                    rs.updateString("sdescript", sdesc);
                    rs.updateString("icon", fn[0]);

                    rs.insertRow();

                    out.println("success");

                }
         

        }
        catch(Exception ex){
            ex.printStackTrace();
        }

    }
}

