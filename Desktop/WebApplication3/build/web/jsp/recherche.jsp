<%-- 
    Document   : recherche
    Created on : 10 mai 2022, 15:11:10
    Author     : admin
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="appl.pk.MyUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet"  href="/WebApplication3/css/rechcss.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="icon" href="./appartment.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  

    <title>Recherche</title>
        
    </head>
    <body style="background-color: #d9d9d9">
        <div class="d2">
    <div class="ull">
    <ul> 
       <li><a class="lk" href="/WebApplication3/jsp/home.jsp">Home</a></li>
    
        <li><a class="lk" href="#">About us</a></li>
        <li><a class="lk" href="#">Contact</a></li>
        <li><a class="lk" href="#">appartements</a></li>
        
        <li><a class="lk" href="#">Villas</a></li>
        <li><a class="lk" href="#">studios</a></li>
        <li><a class="lk" href="/WebApplication3/Login.html">inscrives-vous</a></li>
        <img class="logo" src="../css/images/LOGO-HOMY-site-web-2.png">
       </ul> 
  
  </div>
  <form method="get" action="/WebApplication3/jsp/recherche.jsp"  >
    <div class="form">
  <label class="b"> <br> <i class="fa fa-area-chart" aria-hidden="true"></i>   superficie: </label>
  <input class="inpt" type="number" name="sup"  placeholder="enter le superficie" required>
    <label class="b"> <br><i class="fa fa-map-marker" aria-hidden="true"> </i>  localisation:</label>
      <input class="inpt" type="text" name="local" placeholder="localisation" required>
     
     <span class="bullshit">klnklsxxqxqxqxqjhhihi</span> <label class="b"  > <br><i class="fa fa-money" aria-hidden="true"> </i>   Buget minimal:</label>
      <input class="inpt" type="number" name="prixmin"  placeholder="prix min" required >
      <label class="b"><br> <i class="fa fa-money" aria-hidden="true"> </i>  Buget maximal:</label>
      <input class="inpt" type="number" name="prixmax"  placeholder="prix max" required> 
     
          </div>
          
          <div class="wrapper">
            <input type="radio" name="radgroupe1" id="option-1" value="louer" checked >
            <input type="radio" name="radgroupe1" id="option-2" value="vendre">
              <label for="option-1" class="option option-1">
               
                 <span>louer</span>
                 </label>
                 <label for="option-2" class="option option-2">
                  
                   <span>vendre</span>
                </label>
               
              </div>
              <span>  
                <label class="type" for="Type de maison"> <i class="fa fa-home" aria-hidden="true"></i>   type de bien :</label>
                <select id="maison" name="maison">

                <option value="villa">villa</option>
                <option value="msn">maison</option>
                <option value="appartement">appartement</option>
                <option value="studio">studio</option>
               
               </select> <button class="send" type="submit">Recherche</button>

               
              </span>
              
            

  </form>
 
</div>
  
  <%
       String vd;
  String loc=request.getParameter("local");
  String sup=request.getParameter("sup");
  String bien=request.getParameter("maison");
  String radio=request.getParameter("radgroupe1");
  int prixmin =Integer.parseInt(request.getParameter("prixmin"));
  int prixmax =Integer.parseInt(request.getParameter("prixmax"));
  if(radio.equals("vendre")){
   vd="vendre";
  }else{
      vd ="louer";
  }
  Connection con =MyUtil.seConnecter();
  ResultSet rs;
  Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
  rs=st.executeQuery(" select * from details where lower(localisation)= lower ('"+loc+"') or  prix between '"+prixmin+"' and '"+prixmax+"' or superficie ='"+sup+"' or type_bien='"+bien+"' or type_an='"+vd+"' ");
 
  %>
 
  
 <section class="sec" style="display: flex; flex-wrap: wrap">
     <%
      if(rs.next()){ 
      rs.beforeFirst();
     while(rs.next()){
        
     %>
     
     <div class="boxa" >
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
       
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner">
        
  
        <div class="item active">
            <img src="/WebApplication3/imgs/<%= rs.getString(7) %>" alt="Chicago" style="width:100%;height: 240px" />
        </div>
      
        <div class="item">
          <img src="/WebApplication3/imgs/<%= rs.getString(8) %>"alt="New york" style="width:100%;height: 240px"/>
        </div>
        <div class="item">
            <img src="/WebApplication3/imgs/<%= rs.getString(9) %>"  alt="New york" style="width:100%;height: 240px" />
          </div>
      </div>
  
    
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        
      </a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
       
      </a>
    </div>

    <h3 class="location"><%= rs.getString(5) %></h3>
    <h3 class="description" ><%= rs.getString(10) %></h3><h3 class="prix">prix:<%= rs.getInt(6) %>dh </h3> <a href="Details.jsp?idan=<%= rs.getInt(1) %>"  ><button class="button"> more</button></a>
 </div>
  
  <%
      }
}else{
   %>
</section>

<div class="alert alert-info" role="alert" style="text-align: center">
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>  Aucune Annonce n existe avec ces critéres!
</div>
   
<%
    }
%>
    
 
    </body>
</html>
