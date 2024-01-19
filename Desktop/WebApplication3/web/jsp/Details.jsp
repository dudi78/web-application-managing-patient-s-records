 <%-- 
    Document   : Details
    Created on : 27 avr. 2022, 18:30:03
    Author     : admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="appl.pk.MyUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/WebApplication3/css/Details.css" type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <title>Details</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            String idnon = request.getParameter("idan");

            Connection con = MyUtil.seConnecter();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select u.nom,u.prenom,u.tel,d.localisation,d.prix,d.descri,d.type_bien,d.type_an ,d.img1,u.Gmail from details d,users u where d.id_an='" + idnon + "' and u.username=d.username");

        %>
        <%            while (rs.next()) {

        %>
        <div class="annonces">

            <div class="card" >
                <img src="/WebApplication3/imgs/<%= rs.getString(9)%>" class="card-img-top" >
                <div class="card-body">
                    <h1><%= rs.getString(7)%></h1>
                    <h2> <%= rs.getString(8)%></h2>
                    <h3 class="card-title"><%= rs.getString(4)%></h3>
                    <h4 class="card-title">prix:<%= rs.getString(5)%></h4>
                    <p class="card-text"> <%= rs.getString(6)%></p>

                </div>

            </div>
            <div class="page-content page-container" id="page-content" style="margin-left: 6%; margin-top:1% ">
                <div class="padding">
                    <div class="row container d-flex justify-content-center">
                        <div class="col-xl-6 col-md-12">
                            <div class="card user-card-full">
                                <div class="row m-l-0 m-r-0">
                                    <div class="col-sm-4 bg-c-lite-green user-profile">
                                        <div class="card-block text-center text-white">
                                            <div class="m-b-25">
                                                <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                                            </div>
                                            <h6 class="f-w-600"><%= rs.getString(2)  %>- <%= rs.getString(1)  %></h6>
                                            
                                            <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="card-block">
                                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Contactez moi  </h6>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                  <p class="m-b-10 f-w-600"> <i class="fa fa-weixin" aria-hidden="true"></i> Email</p>
                                                    <h6 class="text-muted f-w-400"><%= rs.getString(10)  %></h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600"><i class="fa fa-phone" aria-hidden="true"></i> Phone</p>
                                                    <h6 class="text-muted f-w-400"><%= rs.getString(3)  %></h6>
                                                </div>
                                            </div>
                                            <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Informations Personnel </h6>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600"><i class="fa fa-user" aria-hidden="true"></i> Nom</p>
                                                    <h6 class="text-muted f-w-400"> <%= rs.getString(2)  %></h6>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600"><i class="fa fa-user-o" aria-hidden="true"></i> Prenom</p>
                                                    <h6 class="text-muted f-w-400"> <%= rs.getString(1)  %></h6>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          

            </div>


            <%
                }
            %>


        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
