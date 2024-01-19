<%-- 
    Document   : Ajouterannonce
    Created on : 12 mai 2022, 13:00:22
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"  href="/WebApplication3/css/Ajouteran.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajouterannonce</title>
        <link rel="icon" href="./appartment.png">
        <link rel="stylesheet" href="/WebApplication3/css/Ajouteran.css"  type="text/css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>


    <body >
       


        <jsp:include page="header.jsp"></jsp:include>
            <div class="container"  style="background-color: #d1ecc7 ; border-radius: 2% ; margin-bottom: 3%" >
                <form  style="padding: 3%" action="/WebApplication3/ajouter" method="post" enctype="multipart/form-data">
                    <input class="p1" type="radio" name="radgroup1" id="r1" value="vendre" checked="">
                    <i class="fa fa-key" aria-hidden="true"></i><label for="rd1">vendre</label>


                    <input class="p1" type="radio" name="radgroupe" id="r2" value="louer">
                    <i class="fa fa-retweet" aria-hidden="true"></i><label for="rd2">louer</label>

                    <div class="form-group">
                        <label for="exampleFormControlSelect1"><i class="fa fa-home" aria-hidden="true"></i>  Type de Bien:</label>
                        <select class="form-control" name="maison" id="exampleFormControlSelect1">
                            <option value="villa">villa</option>
                            <option value="appartement">appartement</option>
                            <option value="studio">studio</option>
                            <option value="maison">maison</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="superficie"><i class="fa fa-area-chart" aria-hidden="true"></i> superficie</label>
                        <input type="number" class="form-control" name="sup" id="exampleFormControlInput1" placeholder="entrez la superficie">
                    </div>

                    <div class="form-group">
                        <label for="localisation"> <i class="fa fa-map-marker" aria-hidden="true"></i> Localisation:</label>
                        <input type="text" name="local" class="form-control" id="exampleFormControlInput1" placeholder="entrez le prix">
                    </div>
                    <div class="form-group">
                        <label for="Prix"><i class="fa fa-money" aria-hidden="true"></i> Prix:</label>
                        <input type="number" name="prix" class="form-control" id="exampleFormControlInput1" placeholder="entrez le prix">
                    </div>


                    <div class="form-group">
                        <label for="description"><i class="fa fa-file-text" aria-hidden="true"></i> Description:</label>
                        <textarea class="form-control" name="desc" id="exampleFormControlTextarea1" rows="4"></textarea>
                    </div>
             
                    <label for="img"><i class="fa fa-picture-o" aria-hidden="true"></i>Images:</label>
                    <div class="custom-file">

                        <input type="file" name="img1" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile" id="lb">Choisissez image</label>

                    </div>

                    <div class="custom-file">
                        <input type="file" name="img2" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile" id="lb">Choisissez image</label>


                    </div>
                    <div class="custom-file">
                        <input type="file" name="img3" class="custom-file-input" id="validatedCustomFile" required>
                        <label class="custom-file-label" for="validatedCustomFile" id="lb">Choisissez image</label>
                    </div>
                    <br><br>
                    <button type="submit" class="btn btn-primary"> Ajouter l'annonce</button>
                </form>
            </div>
            
        <jsp:include page="Footer.jsp"></jsp:include>

    </body>
</html>
