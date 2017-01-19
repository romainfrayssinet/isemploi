<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleEleve.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<title>Profil</title>
</head>
<body>
	<div class="row">
		<nav class="col-lg-12">
			<div class="container">
					<section class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
						<img src="http://mailing.isep.fr/test/logo-isep-297x125.png" alt="logo-isep" class="img-responsive logo-isep">
					</section>
					<section class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
						<ul class="nav nav-tabs nav-justified">
							<li class="active"><a href="#profil">Profil</a></li>
							<li><a href="#valid">Validation</a></li>
							<li><a href="#contact">Contact</a></li>
						</ul>
					</section>
				</div>
			</nav>
		</div>
    <div class="container">
      <div class="row">
        <nav class="col-lg-3">
          <img src="http://storage.iseplive.fr/avatars/${sessionScope.sessionUtilisateur.debutNumero}/${sessionScope.sessionUtilisateur.numero}.jpg" class="img-rounded img-responsive" alt="imageEleve" style="margin-left: auto; margin-right: auto;">
          <h2>${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</h2>

          <div class="infos">
          
          	<c:choose>
				<c:when test = "${ empty sessionScope.sessionUtilisateur.situation }">
	   				<p>Quelle est votre situation à l'ISEP ?<p>
				</c:when>
			    <c:otherwise>
			     	<p>${sessionScope.sessionUtilisateur.situation}</p>
			    </c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = "${ empty sessionScope.sessionUtilisateur.parcours }">
	   				<p>Indiquez votre parcours !<p>
				</c:when>
			    <c:otherwise>
			     	<p>Parcours ${sessionScope.sessionUtilisateur.parcours}</p>
			    </c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = "${ empty sessionScope.sessionUtilisateur.recherche }">
					<p>Où travaillez-vous ?<p>
				</c:when>
			    <c:otherwise>
              		<p>${sessionScope.sessionUtilisateur.lieuTravail}</p>
			    </c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test = "${ empty sessionScope.sessionUtilisateur.recherche }">
	   				<p>Que recherchez-vous ?<p>
				</c:when>
			    <c:otherwise>
              		<p>Recherche ${sessionScope.sessionUtilisateur.recherche}</p>
			    </c:otherwise>
			</c:choose>
              
              
              <button type="button" class="btn btn-primary" name="modifInfos" data-toggle="modal" data-target="#modifInfoElv">Modifier infos</button>

			  <div class="modal fade" id="modifInfoElv" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myModalLabel">Modifier vos informations</h4>
                      <form method="post" action="">
                        <div class="modal-body">
                        <div class="form-group">
                          <label for="statut">Modifier votre situation actuelle:</label>
                          <input type="text" class="form-control" name="newStatut" value="${sessionScope.sessionUtilisateur.situation}">
                        </div>
                        <div class="form-group">
                          <label for="recherche">Promotion:</label>
                          <input type="text" class="form-control" name="newPromo" value="${sessionScope.sessionUtilisateur.promo}">
                        </div>
                        <div class="form-group">
                          <label for="parcours">Modifier votre parcours:</label>
                          <input type="text" class="form-control" name="newParcours" value="${sessionScope.sessionUtilisateur.parcours}">
                        </div>
                        <div class="form-group">
                          <label for="lieu">Modifier le lieu où vous étudiez:</label>
                          <input type="text" class="form-control" name="newLieu" value="${sessionScope.sessionUtilisateur.lieuTravail}">
                        </div>
                        <div class="form-group">
                          <label for="recherche">Que recherchez vous ?</label>
                          <input type="text" class="form-control" name="newRecherche" value="${sessionScope.sessionUtilisateur.recherche}">
                        </div>
                        <div class="form-group">
                          <label for="recherche">Téléphone:</label>
                          <input type="text" class="form-control" name="newPhone" value="${sessionScope.sessionUtilisateur.portable}">
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        <input type="submit" name="boutonModifInfosEleve" class="btn btn-primary">
                      </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
          </div>
        </nav>
        <section class="col-lg-9">
          <div class="tab-content">
            <div id="profil" class="tab-pane fade in active">
				<fieldset><legend>ISEP:</legend>
					<c:choose>
						<c:when test = "${ empty sessionScope.sessionUtilisateur.promo }">
			   				<p>Indiquez votre promo !<p>
						</c:when>
					    <c:otherwise>
					     	<p><u>Promotion :</u> ${sessionScope.sessionUtilisateur.promo}</p>
					    </c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test = "${ empty sessionScope.sessionUtilisateur.parcours }">
			   				<p>Indiquez votre parcours !<p>
						</c:when>
					    <c:otherwise>
					     	<p><u>Parcours suivi:</u> ${sessionScope.sessionUtilisateur.parcours}</p>
					    </c:otherwise>
					</c:choose>
				</fieldset>
				<fieldset><legend>Upload:</legend>
	              <div class="upload">
					<div class="row">
						<div class="col-lg-6">
							<legend>Partager votre CV</legend>
							<input id="imageCV" type="image" src="${pageContext.request.contextPath}/assets/images/upload.png" class="addCV" style="width: 20%;">
							<input type="file" id="uploadCV" style="display:none;">
							<script>
								$("input[id='imageCV']").click(function() {
									$("input[id='uploadCV']").click();
								});
							</script>
							<span class='label label-info' id="uploadCV"></span><br>
						</div>
						<div class="col-lg-6">
							<legend>Partager votre Lettre de Motivation</legend>
							<input id="imageLM" type="image" src="${pageContext.request.contextPath}/assets/images/upload.png" class="addLM" style="width: 20%;">
							<input type="file" id="uploadLM" style="display:none;">
							<script>
								$("input[id='imageLM']").click(function() {
									$("input[id='uploadLM']").click();
								});
							</script>
							<%-- <img src="${pageContext.request.contextPath}/assets/images/upload.png" class="addLM" onclick="javascript:$('#upload-lm').html($(this).val());" alt="addLM" name="uploadLM"/>
							<label class="btn btn-primary btn-file">
	  							Lettre de motivation <input type="file" class="hidden" onchange="$('#upload-lm').html($(this).val());">
							</label> --%>
							<span class='label label-info' id="upload-lm"></span>
						</div>
					</div>
	              </div>
				</fieldset>
				<fieldset><legend>Contact:</legend>
					<p><u>Profil LinkedIn:</u> <a href="${sessionScope.sessionUtilisateur.linkedin}" target="_blank">${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</a></p>
					<p><u>E-Mail:</u> ${sessionScope.sessionUtilisateur.email}</p>
					<c:choose>
						<c:when test = "${ empty sessionScope.sessionUtilisateur.portable }">
			   				<p>Renseignez votre téléphone !<p>
						</c:when>
					    <c:otherwise>
					     	<p><u>Téléphone:</u> ${sessionScope.sessionUtilisateur.portable}</p>
					    </c:otherwise>
					</c:choose>
				</fieldset>
              <fieldset><legend class="addBtn">Expériences:<img src="${pageContext.request.contextPath}/assets/images/plus.png" class="addBtn" alt="plusXP" name="modifInfos" data-toggle="modal" data-target="#ajoutExperience"/></legend>
				<ul>
					<c:forEach var = "experience" items = "${experiences}">
						<p>
							<u>${experience.type} chez ${experience.entreprise} : ${experience.poste} pendant ${experience.duree}</u><br>
							${experience.description}
						</p>
					</c:forEach>
				</ul>
              </fieldset>
              <fieldset><legend class="addBtn">Compétences:<img src="${pageContext.request.contextPath}/assets/images/plus.png" class="addBtn" alt="plusXP" name="modifInfos" data-toggle="modal" data-target="#ajoutCompetence"/></legend>
                <c:forEach var = "competence" items = "${competencesEleve}">
               		#${competence.nom}
                </c:forEach>
              </fieldset>
              <fieldset><legend class="addBtn">Intérêts:<img src="${pageContext.request.contextPath}/assets/images/plus.png" class="addBtn" alt="plusXP" name="modifInfos" data-toggle="modal" data-target="#ajoutInteret"/></legend>
               	<c:forEach var = "interet" items = "${interetsEleve}">
               		#${interet.nom}
                </c:forEach>
              </fieldset>
            </div>

            <div id="valid" class="tab-pane fade">
              <h2><b>Déclaration de stage</b></h2><br>
							<div class="radio">
								<label class="radio-inline"><input type="radio" name="optradio">A2</label>
								<label class="radio-inline"><input type="radio" name="optradio">A3</label>
								<label class="radio-inline"><input type="radio" name="optradio">Césure</label>
								<label class="radio-inline"><input type="radio" name="optradio">Msc</label>
							</div>
							<fieldset><legend>Elève:</legend>
								<div class="form-group">
									<u>Nom et Prénom:</u> ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom} <br>
								</div>
								<div class="form-group">
									<u>Parcours:</u> ${sessionScope.sessionUtilisateur.parcours}<br>
								</div>
								<div class="form-group">
	                <u>N° de sécurité sociale:</u>
	                <input class="form-control" type="text" name="numSecu">
	              </div>
								<div class="form-group">
	                <u>Adresse durant le stage (si différent de l'actuelle):</u>
	                <input class="form-control" type="text" name="adresse">
	              </div>
								<div class="form-group">
	                <u>Adresse e-mail:</u>
	                ${sessionScope.sessionUtilisateur.email}
	              </div>
								<div class="form-group">
	                <u>Tél. portable:</u>
	                ${sessionScope.sessionUtilisateur.portable}
	              </div>
							</fieldset>
							<fieldset><legend>Entreprise:</legend>
								<div class="form-group">
									<b>Numéro SIRET de l'Entreprise:</b>
									<input class="form-control" type="number" name="siret">
								</div>
								<div class="form-group">
	                <b>Code APE:</b>
	                <input class="form-control" type="number" name="ape">
	              </div>
								<div class="form-group">
	              	Nom et adresse (A) de la société signataire de la convention ou du contrat:
	                <input class="form-control" type="text" name="adresseEntreprise">
	              </div>
								<div class="form-group">
	              	Adresse (B) complète du lieu du stage (si différente de l'adresse A):
	                <input class="form-control" type="text" name="adresseStage">
	              </div>
								<div class="form-group">
	              	Nom du service d'accueil dans la société:
	                <input class="form-control" type="text" name="nomServiceAccueil">
	              </div>
								<div class="form-group">
	                Standard Téléphonique <u>du lieu du stage</u>:
	                <input class="form-control" type="tel" name="telStage">
	              </div>
								<div class="form-group">
	                Nom et prénom adresse (C) de la personne à qui il faut adresse la convention de stage le cas échéant:
	                <input class="form-control" type="text" name="contactConvention">
	              </div>
								<div class="form-group">
	                N° de Tél.:
	                <input class="form-control" type="tel" name="telConvention">
	              </div>
								<div class="form-group">
	                <b>Adresse e-mail:</b>
	                <input class="form-control" type="email" name="mailConvention">
	              </div>
				</fieldset>
				<fieldset><legend>Responsable de stage:</legend>
					<div class="form-group">
						Nom: <input class="form-control" type="text" name="nomRespo">
						Prénom: <input class="form-control" type="text" name="prenomRespo">
					</div>
					<div class="form-group">
	                	N° de Tél.:
	                	<input class="form-control" type="tel" name="telRespo">
	             	 </div>
					<div class="form-group">
	                	<b>Adresse e-mail:</b>
	                	<input class="form-control" type="email" name="mailRespo">
	              	</div>
					<div class="form-group">
	               		 Fonction précise dans la société:
	                	<input class="form-control" type="text" name="fonctionRespo">
	              	</div>
				</fieldset>
				<fieldset><legend>Stage:</legend>
					<div class="form-group">
						<b><u>Thème du stage (en une ou deux lignes) - et remplir annexe:</u></b>
						<textarea class="form-control" name="mail" rows="8" cols="70"></textarea>
					</div>
					<div class="form-group">
						Date prévues pour le stage, du <input class="form-control" type="date" name="dateDebutStage"> au <input class="form-control" type="date" name="dateFinStage">
					</div>
					<div class="form-group">
	                	<b>Indémnité de stage en euros, mensuelle brute:</b>
	                	<input class="form-control" type="number" name="indemnite">
	              	</div>
								<div class="form-group">
	                Avantages en nature en euros:
	                <input class="form-control" type="number" name="avantage">
	              </div>
								<div class="form-group">
									A l'étranger, Si l'indémnité est supérieur à 15% du plafond mensuel de la sécurité sociale (cad supérieure à 554,40€), la société s'engage-t-elle à assurer la couverture des risques Maladie et Accident du travail?
									<label class="radio-inline"><input type="radio" name="optradio" value="oui">Oui</label>
									<label class="radio-inline"><input type="radio" name="optradio" value="non">Non</label>
								</div>
								<div class="form-group">
	                Déplacement à l'étranger au cours du stage (effectué en France):
									<label class="radio-inline"><input type="radio" name="optradio" value="oui">Oui</label>
									<label class="radio-inline"><input type="radio" name="optradio" value="non">Non</label>
	              </div>
								<div class="form-group">
	                Par quel moyen vous avez trouvé ce stage:
	                <input class="form-control" type="number" name="trouveStage">
	              </div>
				</fieldset>
							<fieldset><legend>Annexe à la Déclaration de Stage</legend>
								<div class="form-group">
									Présentation succinte de l'Entreprise ou du Service:
									<textarea class="form-control" name="prezEntreprise" rows="8" cols="70"></textarea>
								</div>
								<div class="form-group">
									Contexte dans lequel s'intégre le stage:
									<textarea class="form-control" name="contexteStage" rows="8" cols="70"></textarea>
								</div>
								<div class="form-group">
									Mission confiée au stagiaire - Objectifs:
									<textarea class="form-control" name="missionStage" rows="8" cols="70"></textarea>
								</div>
								<div class="form-group">
									Si possible, principales étapes du stage:
									<textarea class="form-control" name="etapeStage" rows="8" cols="70"></textarea>
								</div>
								<div class="form-group">
									Connaissances requises:
									<textarea class="form-control" name="connaissanceReq" rows="8" cols="70"></textarea>
								</div>
							</fieldset>

              <button type="button" class="btn btn-primary">Envoyer</button>
            </div>

            <div id="contact" class="tab-pane fade">
              <div class="form-group">
                <u>Destinataire:</u>
                <select class="form-control">
                  <option>Responsable parcours</option>
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
            
            <div class="modal fade" id="ajoutExperience" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Ajouter une expérience</h4>
                    <form method="post" action="">
	                    <div class="modal-body">
	                        <div class="form-group">
	                          <label for="statut">Type d'expérience :</label>
	                          <input type="text" class="form-control" name="type" value="">
	                        </div>
	                        <div class="form-group">
	                          <label for="parcours">Entreprise :</label>
	                          <input type="text" class="form-control" name="entreprise" value="">
	                        </div>
	                        <div class="form-group">
	                          <label for="lieu">Poste occupé :</label>
	                          <input type="text" class="form-control" name="poste" value="">
	                        </div>
	                        <div class="form-group">
	                          <label for="recherche">Durée : </label>
	                          <input type="text" class="form-control" name="duree" value="">
	                        </div>
	                      	<div class="form-group">
	                          <label for="recherche">Description : </label>
	                          <input type="text" class="form-control" name="description" value="">
	                        </div>
	                  	</div>
                      	<div class="modal-footer">
                        	<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        	<input type="submit" class="btn btn-primary" name="boutonAjoutExperienceEleve" value="Ajouter">
                      	</div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="modal fade" id="ajoutCompetence" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Ajouter une expérience</h4>
	                    <div class="modal-body">
	                    	<form method="post" action="">
		                        <div class="form-group">
			                        <p class="ajoutExperienceDiv">
			                       		<select class="select" name="competence">
		              						<c:forEach var = "competence" items = "${competences}">
		                					<option value = "${competence.id}" > ${competence.nom} </option>
		              						</c:forEach>
		            					</select>
		            					<input type="submit" class="btn btn-primary" name="boutonAjoutCompetenceEleve" value="Ajouter">
			                        </p>
		                        </div>
	                        </form>
	                        <form method="post" action="">
		                        <div class="form-group">
			                        <h4 class="modal-title" id="myModalLabel">Ou ajoutez-en une si elle n'apparaît pas ci-dessus !</h4>
			                        <p class="ajoutExperienceDiv">
			                        	<input type="text" class="form-control ajoutComp" name="newCompetenceBdd" value="">
			                        	<input type="submit" class="btn btn-primary" name="boutonAjoutCompetenceEleveBdd" value="Ajouter">
			                        </p>
		                        </div>                     
	                        </form>
	                  	</div>
                      	<div class="modal-footer">
                        	<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                      	</div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="modal fade" id="ajoutInteret" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Ajouter un intérêt</h4>
                    <form method="post" action="">
	                    <div class="modal-body">
	                        <div class="form-group">
	                          <label for="statut">Ajoutez l'intérêt :</label>
	                          <input type="text" class="form-control" name="newInteret" value="">
	                        </div>
	                  	</div>
                      	<div class="modal-footer">
                        	<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
                        	<input type="submit" class="btn btn-primary" name="boutonAjoutInteretEleve" value="Ajouter">
                      	</div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          <script>
          $(document).ready(function(){
              $(".nav-tabs a").click(function(){
                  $(this).tab('show');
              });
          });
          </script>
			<footer class="col-lg-12">
					© Griffons Corp.2016
			</footer>
        </section>
      </div>
    </div>
</body>
</html>
