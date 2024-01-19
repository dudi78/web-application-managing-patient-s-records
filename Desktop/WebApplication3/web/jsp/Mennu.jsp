<%-- 
    Document   : Mennu
    Created on : 23 avr. 2022, 20:03:42
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/WebApplication3/css/menu.css" type="text/css">
         <link rel="icon" href="css/images/appartment.png">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <title>JSP Page</title>
    </head>
    <body>
       
     <% 

    if(session.getAttribute("user")!=null){
        
  %>        
<details>
  <summary></summary>
 
  <nav class="menu">
    <a href="#link"> <i id="la" class="fa fa-address-card-o" aria-hidden="true"> </i> Mon compte </a>
    <a href="http://localhost:8082/WebApplication3/jsp/myfav.jsp"> <i class="fa fa-heart-o" aria-hidden="true"> </i> Favoris</a>
    <a href="http://localhost:8082/WebApplication3/jsp/home.jsp"> <i class="fa fa-home" aria-hidden="true"> </i> Home</a>
    <a href="http://localhost:8082/WebApplication3/jsp/mesannonces.jsp"> <i class="fa fa-newspaper-o" aria-hidden="true"> </i> Mes Annonces</a>
    <a href="/WebApplication3/Logout"> <i class="fa fa-sign-out" aria-hidden="true"> </i>deconnexion</a>
    
  <%
      }else{
   response.sendRedirect("/WebApplication3/Login.html");
}
  %> 
  
  
  </nav>
</details>

    
<div class="animated-title">
  <div class="text-top">
    <div>
      <span>Bienvenue</span>
      <span>Chez l'agence</span>
    </div>
  </div>
  <div class="text-bottom">
    <div>Homy</div>
  </div>
</div>
    </body>
</html>
