<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleEleve.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<title>Profil</title>
</head>
<body>
    <div class="row">
		<nav class="col-lg-12">
			<div class="container">
					<section class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
					</section>
					<section class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
			          <ul class="nav nav-tabs nav-justified">
			            <li class="bar active"><a href="#profil">Profil de ${user.prenom} ${user.nom}</a></li>
			            <li class="bar"><a href="#contact">Contacter ${user.prenom} ${user.nom}</a></li>
			            <li class="bar"><a href="${pageContext.request.contextPath}/accueil">Retourner à l'Accueil</a></li>
			          </ul>
					</section>
				</div>
			</nav>
		</div>
    <div class="container">

      <div class="row">
        <nav class="col-lg-3">
          <img src="${pageContext.request.contextPath}/assets/photosProfil/respoParcours.jpg" class="img-rounded img-responsive" alt="imageEleve" width="70%" style="margin-left: auto; margin-right: auto;">
          <h2>${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</h2>
          <div class="infos">

              <p>Enseignant chercheur à l'ISEP</p>
              <p>Paris, France</p>
              <p>Responsable Parcours ${sessionScope.sessionUtilisateur.parcours}</p>
              <button type="button" class="btn btn-primary" name="modifInfos" data-toggle="modal" data-target="#modifInfoRP">Modifier infos</button>

              <div class="modal fade" id="modifInfoRP" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myModalLabel">Modifier vos informations</h4>
                      <div class="modal-body">
                        <div class="form-group">
                          <label for="profession">Modifier votre profession:</label>
                          <input type="text" class="form-control" name="newProfession" value="Enseignant chercheur à l'ISEP">
                        </div>
                        <div class="form-group">
                          <label for="lieu">Modifier le lieu où vous travaillez:</label>
                          <input type="text" class="form-control" name="newLieu" value="Paris, France">
                        </div>
                        <div class="form-group">
                          <label for="role">Modifier votre rôle au sein de l'ISEP:</label>
                          <input type="text" class="form-control" name="newRole" value="Responsable Parcours Systèmes d'Information">
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-primary">Modifier</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </nav>

        <section class="col-lg-9">
          <div class="tab-content">
            <div id="profil" class="tab-pane fade in active">

 				<h2><img src="http://storage.iseplive.fr/avatars/${user.debutNumero}/${user.numero}.jpg" class="img-responsive img-rounded petitePhotoProfil" alt="imageEleve" style="margin-left: auto; margin-right: auto; width:20% "></h2>
            	<h2>${user.prenom} ${user.nom}</h2>
				<fieldset><legend>ISEP:</legend>
					<c:choose>
						<c:when test = "${ empty user.promo }">
			   				<p>${user.prenom} ${user.nom} n'a pas renseigné sa promo !<p>
						</c:when>
					    <c:otherwise>
					     	<p><u>Promotion :</u> ${user.promo}</p>
					    </c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test = "${ empty user.parcours }">
			   				<p>${user.prenom} ${user.nom} n'a pas renseigné son parcours !<p>
						</c:when>
					    <c:otherwise>
					     	<p><u>Parcours suivi:</u> ${user.parcours}</p>
					    </c:otherwise>
					</c:choose>
				</fieldset>
				<fieldset><legend>Fichiers de ${user.prenom}:</legend>
	              <div class="upload">
					<div class="row">
						<div class="col-lg-6">
							<legend>CV</legend>
						</div>
						<div class="col-lg-6">
							<legend>Lettre de Motivation</legend>
						</div>
					</div>
	              </div>
				</fieldset>
				<fieldset><legend>Contact:</legend>
					<p><u>Profil LinkedIn:</u> <a href="${user.linkedin}" target="_blank">${user.prenom} ${user.nom}</a></p>
					<p><u>E-Mail:</u> ${user.email}</p>
					<c:choose>
						<c:when test = "${ empty user.portable }">
			   				<p>${user.prenom} ${user.nom} n'a pas renseigné son téléphone !<p>
						</c:when>
					    <c:otherwise>
					     	<p><u>Téléphone:</u> ${user.portable}</p>
					    </c:otherwise>
					</c:choose>
				</fieldset>
              <fieldset><legend class="addBtn">Expériences:</legend>
				<ul>
					<c:forEach var = "experience" items = "${experiences}">
						<p>
							<u>${experience.type} chez ${experience.entreprise} : ${experience.poste} pendant ${experience.duree}</u><br>
							${experience.description}
						</p>
					</c:forEach>
				</ul>
              </fieldset>
              <fieldset><legend class="addBtn">Compétences:</legend>
                <c:forEach var = "competence" items = "${competencesEleve}">
               		#${competence.nom}
                </c:forEach>
              </fieldset>
              <fieldset><legend class="addBtn">Intérêts:</legend>
               	<c:forEach var = "interet" items = "${interetsEleve}">
               		#${interet.nom}
                </c:forEach>
              </fieldset>
            </div>

            <div id="contact" class="tab-pane fade">
              <div class="form-group">
                <u>Destinataire:</u>
                <select class="form-control">
                  <option>${user.prenom} ${user.nom}</option>
                </select>
              </div>
              <div class="form-group">
                <u>Objet du message:</u>
                <input class="form-control" type="text" name="objMessage">
              </div>
              <div class="form-group">
                <u>Message:</u>
                <textarea class="form-control" name="mail" rows="8" cols="70"></textarea>
              </div>
              <button type="button" class="btn btn-primary">Envoyer</button>
            </div>

          </div>

        </section>
      </div>
    </div>
</body>

<script>
$(document).ready(function(){
    $(".nav-tabs a").click(function(){
        $(this).tab('show');
    });
});
</script>

</html>
