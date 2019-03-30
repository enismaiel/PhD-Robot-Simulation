import java.sql.*;

class Database
  {
    
     Database () 
      {
        
      }
      
    public void createDatabase ()
      {
        try
          {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://remotemysql.com:3306/gPQbxUed4a","gPQbxUed4a","7x0igLcWTF");
            Statement stmt = con.createStatement();
            stmt.executeQuery("use gPQbxUed4a;");
            stmt.executeQuery("create table emp(id int(10),name varchar(40),age int(3));");
            con.close();
          }
         catch (Exception e)
          {
            System.out.println(e);
          }
      }
  }
