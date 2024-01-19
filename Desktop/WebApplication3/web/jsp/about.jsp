<%-- 
    Document   : about
    Created on : 16 juin 2022, 20:30:53
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200&family=Raleway:ital,wght@1,100&family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
    <title>A propos</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
    <img class="logo" src="/WebApplication3/css/images/zac-gudakov-ztWpwTEx728-unsplash.jpg" style=" display: block; width:1350px;height: 500px;">
    <div style="background-color:  #8bad6f; width:1350px;height: 400px;display: flex;justify-content: space-around;">

        <div  style="
        padding: 1%;width: 500px;height:240px;;margin-top: 3%;justify-content: center">
            <h3 style="font-size:large;color: #ffffff;font-family:  'Nunito',' sans-serif';">L'AGENCE IMMOBILIÈRE 2.0
95 % des acheteurs recherchent leur futur logement sur internet. Peut-être parcourez-vous quotidiennement les plateformes immobilières afin d’y trouver le bien de vos rêves? La digitalisation du marché immobilier représente une opportunité unique d’innover et de repenser l’agence immobilière afin de répondre à l’évolution de vos besoins. La structure dématérialisée de HOMY (absence d’agence physique) permet en premier lieu de réduire de manière significative les frais d’agence afin de vous garantir le net vendeur le plus élevé. Les dépenses liées à la location d’un local sont dédiées à des investissements vous profitant directement. HOMY communique sur les plateformes immobilières les plus visitées. Vendre avec HOMY, c’est offrir à votre bien la meilleure des visibilités.</h3>  

        </div>
        <img src="/WebApplication3/css/images/real-estate-agency.png" style="width:300px;height: 300px;margin-top:2% ;">
      
       </div>

       <div style="background-color:#d9d9d9; width:1350px;height: 400px;display: flex;justify-content: space-around;">

        <div  style="
        padding: 2%;width: 500px;height:240px;background-color: azure;margin-top: 3%;">
            <h3 style="font-size:  medium;font-family:  'Nunito', sans-serif;">Lors de la vente ou de l’acquisition  d’un bien immobilier, il est d’usage de considérer toutes ses options. En 2020, 70% des transactions immobilières ont été réalisées avec le concours de professionnels. 30% des transactions ont été conclues entre particuliers. Allez-vous payer à une agence immobilière une commission généralement perçue comme trop onéreuse? Ou affronter seul l’ensemble des contraintes liées à la réalisation de votre projet?</h3>  

        </div>
        <img src="/WebApplication3/css/images/house (1).png" style="width:100px;height: 100px;margin-top:7% ;">
        <div style="width: 500px;height:240px;padding:2%;box-sizing: border-box;background-color: azure;margin-top: 3%;">
            <h3 style="font-size:  medium;font-family: 'Nunito', sans-serif;">HOMY vous accompagne des prémices à l’aboutissement de votre projet sans vous ruiner. Laissez-vous guider et effectuez les bons choix, qu’il s’agisse de la fixation du prix commercialisation de votre bien, où de l’élaboration de votre stratégie de commercialisation. Profitez d’une prestation de services efficace et vendez votre bien dans les meilleures conditions tout en préservant votre net vendeur. Les frais de HOMY sont fixes et réduits, et sont dus en cas de succès uniquement.</h3>
        </div>
       </div>
      <footer class="bg-light text-center"  >
        <!-- Grid container -->
        <div class="container p-4 pb-0">
          <!-- Section: Form -->
          <section class="">
            <form action="">
              <!--Grid row-->
              <div class="row d-flex justify-content-center">
                <!--Grid column-->
                <div class="col-auto">
                  <p class="pt-2">
                    <strong>Sign up for our newsletter</strong>
                  </p>
                </div>
                <!--Grid column-->
      
                <!--Grid column-->
                <div class="col-md-5 col-12">
                  <!-- Email input -->
                  <div class="form-outline mb-4">
                    <input type="email" id="form5Example27" class="form-control" />
                    <label class="form-label" for="form5Example27">Email address</label>
                  </div>
                </div>
                <!--Grid column-->
      
                <!--Grid column-->
                <div class="col-auto">
                  <!-- Submit button -->
                  <button type="submit" class="btn btn-primary mb-4">
                    Subscribe
                  </button>
                </div>
                <!--Grid column-->
              </div>
              <!--Grid row-->
            </form>
          </section>
          <!-- Section: Form -->
        </div>
        <!-- Grid container -->
      
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: buttonface;">
          © 2020 Copyright:
          <a class="text-dark" href="https://mdbootstrap.com/">Homy.com</a>
        </div>
        <!-- Copyright -->
      </footer>
    </body>
</html>
