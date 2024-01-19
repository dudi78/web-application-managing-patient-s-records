<%-- 
    Document   : Modifier
    Created on : 27 avr. 2022, 00:33:44
    Author     : admin
--%>

<%@page import="mycls.Userad"%>
<%@page import="appl.pk.MyUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="../css/Modifier.css" type="text/css">
         <link rel="icon" href="./appartment.png">
        <link rel="stylesheet" href="/WebApplication3/css/Ajouteran.css"  type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <title>Modifier Page</title>
    </head>
    <body >
        <jsp:include page="header.jsp"></jsp:include>
        
          <%
        if(session.getAttribute("user")!=null){
         Userad idd =(Userad) session.getAttribute("user");
        String idann= request.getParameter("idan");
        Connection con=MyUtil.seConnecter();
        Statement st=con.createStatement();
        ResultSet res=st.executeQuery(" select * from details where username='"+idd.getUserid()+"' and id_an='"+idann+"'");
        
        
        
         
        while(res.next()){
        %>   
          <div class="container"  style="background-color: #d1ecc7 ; border-radius: 2% ; margin-bottom: 3%" >
              <form  style="padding: 3%" action="/WebApplication3/Update" method="get"  enctype="multipart/multipart-form-data" >
                  <input name="idan" hidden value="<%= res.getInt(1) %>"/>
                    <input class="p1" type="radio" name="radgroup1" id="r1" value="vendre" <%= res.getString(10).equals("vendre")? "checked":"" %>>
                    <i class="fa fa-key" aria-hidden="true"></i><label for="rd1">vendre</label>


                    <input class="p1" type="radio" name="radgroupe" id="r2" value="louer" <%= res.getString(10).equals("louer")? "checked":"" %>>
                    <i class="fa fa-retweet" aria-hidden="true"></i><label for="rd2">louer</label>

                    <div class="form-group">
                        <label for="exampleFormControlSelect1"><i class="fa fa-home" aria-hidden="true"></i>  Type de Bien:</label>
                        <select class="form-control" name="maison" id="exampleFormControlSelect1">
                            <option  selected value="<%=res.getString(3) %>"><%= res.getString(3) %></option>
                            <option  disabled >le ancien type </option> 
                            <option value="villa">villa</option>
                            <option value="appartement">appartement</option>
                            <option value="studio">studio</option>
                            <option value="maison">maison</option>

                        </select>
                            
                    </div>
                    <div class="form-group">
                        <label for="superficie"><i class="fa fa-area-chart" aria-hidden="true"></i> superficie</label>
                        <input type="number" class="form-control" name="sup" id="exampleFormControlInput1" value="<%= res.getInt(4)  %>">
                    </div>

                    <div class="form-group">
                        <label for="localisation"> <i class="fa fa-map-marker" aria-hidden="true"></i> Localisation:</label>
                        <input type="text" name="local" class="form-control" id="exampleFormControlInput1" value="<%= res.getString(5)  %>">
                    </div>
                    <div class="form-group">
                        <label for="Prix"><i class="fa fa-money" aria-hidden="true"></i> Prix:</label>
                        <input type="number" name="prix" class="form-control" id="exampleFormControlInput1" value="<%= res.getInt(6)  %>">
                    </div>


                    <div class="form-group">
                        <label for="description"><i class="fa fa-file-text" aria-hidden="true"></i> Description:</label>
                        <textarea class="form-control" name="desc" id="exampleFormControlTextarea1" rows="4" > <%= res.getString(11)  %></textarea>
                    </div>
             
                   
                    <br><br>
                    <button type="submit" class="btn btn-primary"> Modifier  l'annonce</button>
                </form>
            </div>
        <% }
            } %>
        <jsp:include page="Footer.jsp"></jsp:include>
     
 
</body>
</html>
