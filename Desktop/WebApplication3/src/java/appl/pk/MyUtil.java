/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package appl.pk;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class MyUtil {
 public static Connection seConnecter() throws Exception{
         String user="dudy";
         String mdp="dudy";
         String url="jdbc:oracle:thin:@localhost:1521/xe";
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection(url,user,mdp);
            return con;
        }catch(ClassNotFoundException e){
            throw new Exception("impossible dechareger le driver");
        }catch(SQLException e){
            throw new Exception("impssible de se connect :"+e.getMessage());
        }
   }
    


}
