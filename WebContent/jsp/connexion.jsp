<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleCo.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<title>Connexion</title>
</head>
  <body>
    <header class="row">
      <div class="col-lg-12">
        
      </div>
    </header>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
           <p class="form-title">Connectez-vous !</p>
             <form class="login" action="" method="post">
               <input type="text" placeholder="Identifiant" name="identifiant"/>
               <input type="password" placeholder="Mot de Passe" name="mdp" />
               <input type="submit" value="Connexion" class="btn btn-success btn-sm" />
               <div class="remember-forgot">
                 <div class="row">
                   <div class="checkbox">
                     <label><input type="checkbox" />Se souvenir de moi</label>
                   </div>
                 </div>
               </div>
             </form>
           </div>
      </div>
    </div>
  </body>
</html>
