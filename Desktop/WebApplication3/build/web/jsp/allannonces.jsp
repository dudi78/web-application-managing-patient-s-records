<%-- 
    Document   : allannonces
    Created on : 31 mai 2022, 20:52:30
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
         <link rel="stylesheet"  href="/WebApplication3/css/rechcss.css" type="text/css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="icon" href="./appartment.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
       
    </head>
    <body>
       <jsp:include page="header.jsp"></jsp:include>
         
       <%
       String bien=request.getParameter("bien");
       Connection con=MyUtil.seConnecter();
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select*from details ");
       
       
       
       %>
     <section class="sec" style="display: flex; flex-wrap: wrap">
     <%
     
     
     while(rs.next()){
        
     %>
     <% if(request.getParameter("done")!=null){ %>
      <div style="margin: auto;  width: 50%;" class="alert alert-primary " role="alert">
          <h2> <%=request.getAttribute("nop")%></h2>
        </div>
        <% }else{
if(request.getAttribute("nop")!=null){
%>
          <div style="margin: auto;  width: 50%;" class="alert alert-primary " role="alert">
          <h2> <%=request.getAttribute("nop")%></h2>
        </div>

      <%  }
          }
      %>
   <div class="boxa"style="box-sizing: border-box" >
    <div id="myCarousel" class="carousel slide" data-ride="carousel" ">
       
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      
      <div class="carousel-inner">
        
      
        <div class="item active">
            <img src="/WebApplication3/imgs/<%= rs.getString(7) %>" alt="Chicago" style="width:100%; height: 240px" />
            
        </div>
        
        <div class="item">
          <img src="/WebApplication3/imgs/<%= rs.getString(8) %>"alt="New york" style="width:100%;height: 240px" "/>
        </div>
        <div class="item">
            <img src="/WebApplication3/imgs/<%= rs.getString(9) %>"  alt="New york" style="width:100%;height: 240px" " />
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
     <% if(session.getAttribute("user") != null){%>
                    <a href="/WebApplication3/Fav?idan=<%= rs.getInt(1) %>" style="margin-left: 2%" > <img src="/WebApplication3/css/images/heart.png"  style="width: 30px" ></a>
                    <% } %>
 </div>
  
  
  <%
      }

   %>
</section>
    </body>
</html>
