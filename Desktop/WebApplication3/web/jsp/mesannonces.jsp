<%-- 
    Document   : mesannonces
    Created on : 23 avr. 2022, 18:27:37
    Author     : admin
--%>

<%@page import="mycls.Userad"%>
<%@page import="mycls.Userad"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="appl.pk.MyUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <link rel="stylesheet"  href="../css/annonces.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>
         <% session.getAttribute("user");
           Userad id=(Userad) session.getAttribute("user");
         %>
         <Header class="head">
               <a href="/WebApplication3/jsp/home.jsp" class="logo" ><img  style="width: 120px; margin-top: 1%"  src="/WebApplication3/css/images/LOGO-HOMY-site-web-2.png"></a>

      <a href="Ajouterannonce.jsp" class="btn btn-success">Ajouter une nouvelle annonce</a> 


 </Header> 
     
       
        <%
        Connection con=MyUtil.seConnecter();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select* from details where username='"+ id.getUserid()+"'");
        
        %>
        
          
      
        <div class="annonces">
       <%
        while(rs.next()){
        %> 
  <div class="card" >
      <img src="/WebApplication3/imgs/<%= rs.getString(7) %>" class="card-img-top" style="height: 300px" >
    <div class="card-body">
      <h1 id="typebien"> <%= rs.getString(3)   %></h1>
      <h2 id="typean"> <%= rs.getString(10)   %> </h2>
      <h3 id="lc" class="card-title"> Localisation:<%= rs.getString(5)   %></h3>
      <h4 id="price" class="card-title">prix:<%= rs.getString(6)   %></h4>
      <p class="card-text"><%= rs.getString(11) %></p>
      <a href="Modifier.jsp?idan=<%= rs.getInt(1) %>" class="btn btn-primary" >Modifier</a>  <a href="/WebApplication3/delete?idan=<%= rs.getInt(1) %>" class="btn btn-danger">Supprimer</a>
    </div>
  </div>
    <% 
               }
       
        %>
        </div>
       
        
       
      
  
    </body>
</html>
