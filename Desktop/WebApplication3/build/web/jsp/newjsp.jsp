<%-- 
    Document   : newjsp
    Created on : 13 avr. 2022, 18:17:53
    Author     : admin
--%>

<%@page import="appl.pk.MyUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page  language="java" contentType="text/html ; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
    
        %>
        <% 
        List<String> users_name=new ArrayList <String>();
        String nm="imane";
        users_name.add(nm);
        
        %>
        <%=users_name.get(0)%>
        
        <%! 
        public int somme(int a,int b){
           int res=a+b;

           return res;
        } 
        %>
        <%=somme(10,10)%>
        <% 
        String name="dunia";
        String prenom="saidi";
        out.print(name+","+prenom);
        
        
        
        %>
        <%=name %>
        <%
            Connection con=MyUtil.seConnecter();
            ResultSet rs=con.createStatement().executeQuery("select*from joueur");
            
            %>
            <table>
                <tr> <th>idj</th>  <th>nom</th>   <th>prenom</th>   <th>age</th> </tr>
                <%
                    while(rs.next()){
                       %> 
                
                 <tr> 
                
                     <td> <%= rs.getInt(1) %> </td>
                     <td> <%= rs.getString(2) %></td>
                     <td> <%= rs.getString(3) %></td>
                      <td> <%= rs.getInt(4) %></td>
              </tr>
              
                    <%
                      }
                  rs.close();
                  con.close();
                    %>
              
            </table>
    </body>
</html>
