<%-- 
    Document   : myfav
    Created on : 5 juin 2022, 16:57:30
    Author     : admin
--%>

<%@page import="appl.pk.MyUtil"%>
<%@page import="mycls.Userad"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet"  href="../css/annonces.css" type="text/css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
         <% session.getAttribute("user");
           Userad id=(Userad) session.getAttribute("user");
         %>


        <%
        Connection con=MyUtil.seConnecter();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select d.* from details d ,favoris f where f.userh='"+ id.getUserid()+"' and d.id_an=f.idan");
        
        %>
        
          
      
        <div class="annonces">
       <%
        while(rs.next()){
        %> 
  <div class="card" style="box-sizing: border-box">
      <img src="/WebApplication3/imgs/<%= rs.getString(7) %>" class="card-img-top" >
    <div class="card-body">
      <h1 id="typebien"> <%= rs.getString(3)   %></h1>
      <h2 id="typean"> <%= rs.getString(10)   %> </h2>
      <h3 id="lc" class="card-title"> Localisation:<%= rs.getString(5)   %></h3>
      <h4 id="price" class="card-title">prix:<%= rs.getString(6)   %></h4>
      <p class="card-text"><%= rs.getString(11) %></p>
      <a href="Details.jsp?idan=<%= rs.getInt(1) %>" class="btn btn-primary" >Plus d'informations</a>
    </div>
  </div>
    <% 
               }
       
        %>
        </div>
       
        
    </body>
</html>
