<%-- 
    Document   : home
    Created on : 27 mai 2022, 23:45:27
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
        <link rel="stylesheet"  href="/WebApplication3/css/home.css" type="text/css">
        <link rel="stylesheet" href="../htmcssdounia/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <link rel="icon" type="image/png" href="./appartment.png"/>





    </head>
    <body>


        <header class="header" >
            <img class="logo" src="/WebApplication3/css/images/LOGO-HOMY-site-web-2.png">

            <nav class="toplinks">

                <% 

                    if (session.getAttribute("user") == null) {
                %>
                <a href="http://localhost:8082/WebApplication3/jsp/about.jsp" class="nlinks"><i class="fa fa-info-circle" aria-hidden="true"></i>  A propos</a>
                <a href="#" class="nlinks"><i class="fa fa-university" aria-hidden="true"></i>  Agences</a>

                <a href="http://localhost:8082/WebApplication3/jsp/allannonces.jsp" class="nlinks"><i class="fa fa-newspaper-o" aria-hidden="true"></i>  Des annonces</a>
                <a href="http://localhost:8082/WebApplication3/Login.html" class="nlinks"><i class="fa fa-user-plus" aria-hidden="true"></i>   Connexion</a>

                <%
                } else {
                %>
                
                <a href="/WebApplication3/jsp/about.jsp" class="nlinks"><i class="fa fa-info-circle" aria-hidden="true"></i>  A propos</a>
                <a href="#" class="nlinks"><i class="fa fa-university" aria-hidden="true"></i>  Agences</a>
                <a href="http://localhost:8082/WebApplication3/jsp/allannonces.jsp" class="nlinks"><i class="fa fa-newspaper-o" aria-hidden="true"></i>  Des annonces</a>

                <a href="http://localhost:8082/WebApplication3/jsp/Mennu.jsp" class="nlinks"><i class="fa fa-user-circle" aria-hidden="true"></i> Mon Profile</a>
                <%
                    }
                %>
            </nav>





        </header>


        <main class="main">
            <form class="top" action="/WebApplication3/jsp/recherche.jsp">

                <div class="d1" id="dk" ><br><br>
                    <video class="video" height="600px"  src="/WebApplication3/css/images/production ID_4770380.mp4" muted loop autoplay></video>

                    <div class="dv" style=" margin-bottom: 4%;">

                        <input class="p1" type="radio" name="radgroupe1" id="r1" value="vendre">
                        <label for="rd1">vendre</label>


                        <input class="p1" type="radio" name="radgroupe1" id="r2" value="louer">
                        <label for="rd2">louer</label><br>
                        <label class="type" for="Type de maison" > <i class="fa fa-home" aria-hidden="true"></i>type de bien :</label>
                        <select id="maison" name="maison">

                            <option value="villa">villa</option>
                            <option value="maison">maison</option>
                            <option value="appartement">appartement</option>
                            <option value="studio">studio</option>

                        </select>

                        <p class="b"><br> <i class="fa fa-area-chart" aria-hidden="true"></i>  superficie: </p>
                        <input class="inpt" style="padding: 1%; height: 30px" type="number" name="sup" placeholder="enter le superficie" required>
                        <p class="b"> <br><i class="fa fa-map-marker" aria-hidden="true"></i>  localisation:</p>
                        <input class="inpt"style="padding: 1%; height: 30px" type="text" name="local" placeholder="localisation" required>
                        <p class="b"  > <br><i class="fa fa-money" aria-hidden="true"></i>  Buget minimal:</p>
                        <input class="inpt" style="padding: 1%; height: 30px" type="number" name="prixmin" placeholder="prix min" required>
                        <p class="b"><br> <i class="fa fa-money" aria-hidden="true"></i>  Buget maximal:</p>
                        <input class="inpt" style="padding: 1%; height: 30px" type="number" name="prixmax" placeholder="prix max" required> <br>


                        <button class="btn" >search</button>


                    </div>
                </div>

            </form>




            <%
                Connection con = MyUtil.seConnecter();
                Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = st.executeQuery("select * from( select * from details) where rownum<=4 ");

            %>
            <H2 class="picks"> Top picks</H2>
            <section class="topannonce">
                
                <%    if(rs.next()){ 
                      rs.beforeFirst();   
                    while (rs.next()) {
                %>
                <div class="card" style="margin-left: 1%; margin-right: 1%; box-sizing: border-box; ">
                    
                    <img src="/WebApplication3/imgs/<%= rs.getString(7)%>"alt="house" height="200px">
                    <% if(session.getAttribute("user") != null){%>
                    <a href="" style=" position: relative; margin-top: -60%;" onclick="like('<%= rs.getInt(1) %>');"> <img src="/WebApplication3/css/images/heart.png" width="30px " ></a>
                    <h3 class="location" style="margin-left: 2%;margin-top:58%"> <%= rs.getString(5)%></h3>

                    <% } %>
                    <h3 class="location" style="margin-left: 2%;margin-top:6%"> <%= rs.getString(3)%></h3>
                    <p class="description" style="margin-left: 2%"><%= rs.getString(11).substring(0, 50)%></p>
                    <h3 class="prix" style="margin-left: 2%"><%= rs.getInt(6)%> dh</h3>

                    <a href="jsp/Details.jsp?idan=<%= rs.getInt(1)%>"  ><button class="button" style=" margin-left: 12em"> more</button></a>
                </div>

                <%
                    }
     
                    }else{
%>


                          <h1> NOTHING YET </h1>


                <%
                }
                %>



            </section>




            <div class="wrap" style="margin-top: 7% ; box-sizing: border-box;">

                <div class="box one" style="box-sizing: border-box; height: 540px;">
                    <img class="mimi" style="width: 130px ;margin-right: 20%"  src="/WebApplication3/css/images/deal.png" >
                    <h3>  Do something you really like, and hopefully it pays the rent. As far as I'm concerned, that's success. </h3>
                    <div class="button_slide slide_right" > <a href="#dk" class="hadi" style="text-decoration: none; color:  #FFF "> Search  homes </a>  </div>

                </div>

                <div class="box two" style="box-sizing: border-box; height: 540px;">
                    <img  class="mimi" style="width: 130px ;margin-right: 20%" src="/WebApplication3/css/images/buy-home.png">
                    <h3> 
                        Do something you really like, and hopefully it pays the rent. As far as I'm concerned, that's success.
                    </h3>
                    <div class="button_slide slide_down"> <a href="/WebApplication3/jsp/tst.jsp" style="text-decoration: none ; color:  #FFF  ">see your options </a></div>
                </div>

                <div class="box three" style="box-sizing: border-box; height: 540px;">
                    <img class="mimi" style="width: 130px;margin-right: 20%" src="/WebApplication3/css/images/house.png">
                    <h3>   Do something you really like, and hopefully it pays the rent. As far as I'm concerned, that's success.</h3>
                    <div class="button_slide slide_left"> <a href="/WebApplication3/Login.html"  style="text-decoration: none ; color:  #FFF "> join the sellers</a>  </div>
                </div>

            </div>
            <footer class="bottom" style="margin-top: 2% ;" >

                <img class="logo2" src="/WebApplication3/css/images/LOGO-HOMY-site-web-2.png">
                <h3 class="h3" style="text-decoration: none;">HOMY, l'agence  immobilière en ligne proche de vous ,ou vous trouverez des annonces lancantes par des agences et des personnes lequelles vous pouvez les contactez ,et aussi vous pouvez cree votre propre compte pour lancer votre annonces</h3>
                <br><br>
                <div style=" display: flex ;justify-content: space-around">
                    <div style="margin-left: 4%">
                        <h5> <a href="http://localhost:8082/WebApplication3/jsp/Desannonces.jsp?bien=maison" class="link"> maison </a></h5>
                        <h5> <a href="http://localhost:8082/WebApplication3/jsp/Desannonces.jsp?bien=appartement" class="link">appartements </a> </h5>        
                        <h5> <a href="http://localhost:8082/WebApplication3/jsp/Desannonces.jsp?bien=studio" class="link"> Studio </a> </h5>        
                        <h5> <a href="http://localhost:8082/WebApplication3/jsp/Desannonces.jsp?bien=villa" class="link">villa </a></h5>

                    </div>
                    <img  style=" width: 130px ;margin-left: 2%" src="/WebApplication3/css/images/villa.png"> 
                    <img  style=" width: 130px ;margin-left: 2%" src="/WebApplication3/css/images/flats.png"> 
                    <img  style=" width: 130px ;margin-left: 2%" src="/WebApplication3/css/images/house.png"> 
                    <img  style=" width: 130px ;margin-left: 2%" src="/WebApplication3/css/images/studio.png"> 
                </div> 

                <img class="palm" style="margin-top: -26%; width: 200px" src="/WebApplication3/css/images/palm-png-43080.png"> 




            </footer>






        </main>
     
                
                 <script src="jquery-3.4.1.js"></script>
        <script lang="JavaScript">
                    $(document).ready(function () {
                       
                    });

                   
                     function  like(idan) {
                       
                          
                          $.ajax({
                            type: "GET",
                            url: "/WebApplication3/Fav",
                            dataType: 'html',
                            data: "idan=" + idan,
                            success: function (html) {
                                
                                alert(html);

                            },

                            error: function (er, d, msg) {
                                alert(msg);
                            }
                        });
                        
                    }
                  
                       
                 
        </script>
    </body>
</html>
