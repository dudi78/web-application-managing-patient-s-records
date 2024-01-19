<%-- 
    Document   : tst
    Created on : 27 avr. 2022, 18:16:16
    Author     : admin
--%>

<%@page import="appl.pk.MyUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
        
            
             String locali=request.getParameter("local");
            
        
            
        
        
          Connection con=MyUtil.seConnecter();
             Statement st=con.createStatement();
            ResultSet rs= st.executeQuery("select * from details where localisation='"+locali+"'");
             
            while(rs.next()) {
            
                        %>
              
                      
                            
                            <h1> <%=rs.getString(3) %> </h1>  
                            <h2> hhh</h2>
                            
                        
         <%   
            }
             
            
             %>
        
       
    </body>
</html>
