<%-- 
    Document   : header
    Created on : 26 mai 2022, 15:52:26
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet"  href="/WebApplication3/css/header.css" type="text/css">
    <link rel="stylesheet" href="../htmcssdounia/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header" >
            <a href="/WebApplication3/jsp/home.jsp" class="logo" ><img  class="mg"  src="/WebApplication3/css/images/LOGO-HOMY-site-web-2.png"></a>
  
        <nav class="toplinks">
            
         <% 
         
         if(session.getAttribute("user")==null){
         %>
          <a href="#" class="nlinks"><i class="fa fa-info-circle" aria-hidden="true"></i>  A propos</a>
            <a href="#" class="nlinks"><i class="fa fa-university" aria-hidden="true"></i>  Agences</a>
            
            <a href="http://localhost:8082/WebApplication3/jsp/allannonces.jsp" class="nlinks"><i class="fa fa-newspaper-o" aria-hidden="true"></i>  Des annonces</a>
            <a href="http://localhost:8082/WebApplication3/Login.html" class="nlinks"><i class="fa fa-user-plus" aria-hidden="true"></i>   Connexion</a>
           
            <%
                }else{
            %>
            <a href="http://localhost:8082/WebApplication3/jsp/about.jsp" class="nlinks"><i class="fa fa-info-circle" aria-hidden="true"></i>  A propos</a>
            <a href="#" class="nlinks"><i class="fa fa-university" aria-hidden="true"></i>  Agences</a>
            <a href="http://localhost:8082/WebApplication3/jsp/allannonces.jsp" class="nlinks"><i class="fa fa-newspaper-o" aria-hidden="true"></i>  Des annonces</a>
           <a href="http://localhost:8082/WebApplication3/jsp/Mennu.jsp" class="nlinks"><i class="fa fa-user-circle" aria-hidden="true"></i> Mon Profile</a>
            <%
                }
            %>
        </nav>
        
          
       
       

      </header>
    </body>
</html>
