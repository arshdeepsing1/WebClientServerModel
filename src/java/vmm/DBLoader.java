package vmm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBLoader 
{
    public static ResultSet executeQuery(String SQLString) throws Exception
    {
        
            //////  ##CODE  ///////    
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("1.Driver loading done");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/schema1", "root", "system");
            System.out.println("2.Connection done");
            
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("3.Statement done");
            
            ResultSet rs = stmt.executeQuery(SQLString);
            System.out.println("4.ResultSet Created");
                        
            return rs;
            
            
      
    }

    public static void main(String[] args) 
    {
        try 
        {
            ResultSet rs=DBLoader.executeQuery("select * from deviceinfo where mobileno="+null);
            
            while(rs.next())
            {
                System.out.println(rs.getInt("id")+"  "+rs.getString("devicetoken"));
            }
            
        }
        catch (Exception ex) 
        {
          ex.printStackTrace();
        }
    }

}
