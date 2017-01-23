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
							<li class="bar active"><a href="#profil">Profil</a></li>
							<li class="bar"><a href="#valid">Validation</a></li>
							<li class="bar"><a href="#contact">Contact</a></li>
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
				<c:when test = "${ empty sessionScope.sessionUtilisateur.lieuTravail }">
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


        <button type="button" class="btn" name="modifInfos" data-toggle="modal" data-target="#modifInfoElv" style="opacity:0.9;">Modifier infos</button>
			  <button type="button" class="btn deco" data-toggle="modal" data-target="#deconnexion" style="opacity:0.9;">Déconnexion</button>

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
	                       	<p class="ajoutExperienceDiv">
	                       		<select class="form-control" name="newParcours">
	             					<c:forEach var = "unParcours" items = "${parcours}">
	               						<option value = "${unParcours.id}" > ${unParcours.nom} </option>
	             					</c:forEach>
	           					</select>
	                        </p>
                        </div>
                        <div class="form-group">
                          <label for="lieu">Modifier le lieu où vous étudiez:</label>
                          <input type="text" class="form-control" name="newLieu" value="${sessionScope.sessionUtilisateur.lieuTravail}">
                        </div>
                        <div class="form-group">
                          <label for="recherche">Que recherchez vous ? (Laissez vide si vous ne recherchez rien)</label>
                          <input type="text" class="form-control" name="newRecherche" value="${sessionScope.sessionUtilisateur.recherche}">
                        </div>
                        <div class="form-group">
                          <label for="recherche">Téléphone:</label>
                          <input type="text" class="form-control" name="newPhone" value="${sessionScope.sessionUtilisateur.portable}">
                        </div>
                        <div class="form-group">
                          <label for="recherche">Linkedin:</label>
                          <input type="text" class="form-control" name="newLinkedin" value="${sessionScope.sessionUtilisateur.linkedin}">
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn ferme" data-dismiss="modal">Fermer</button>
                        <input type="submit" name="boutonModifInfosEleve" class="btn">
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
							<u>${experience.type} chez ${experience.entreprise} :</u> ${experience.poste} pendant ${experience.duree}<img src="${pageContext.request.contextPath}/assets/images/suppr.png" class="supprBtn" alt="supprXP" data-toggle="modal" data-target="#supprimerExperience${experience.id}"/><br>
							${experience.description}
						</p>
						<div class="modal fade" tabindex="-1" role="dialog" id="supprimerExperience${experience.id}">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title">Supprimer une expérience</h4>
						      </div>
						      <div class="modal-body">
						        <p>Voulez-vous vraiment supprimer votre expérience chez ${experience.entreprise} ?</p>
						      </div>
						      <form method="post" action="">
						      	<input type="hidden" name="idExperience" value="${experience.id}">
						      	<div class="modal-footer">
						        <button type="button" class="btn ferme" data-dismiss="modal">Annuler</button>
						        <input type="submit" name="boutonSupprimerExperience" class="btn" value="Supprimer">
						      </div>
						      </form>
						    </div>
						  </div>
						</div>
					</c:forEach>
				</ul>
              </fieldset>

              <fieldset><legend class="addBtn">Compétences:<img src="${pageContext.request.contextPath}/assets/images/plus.png" class="addBtn" alt="plusXP" name="modifInfos" data-toggle="modal" data-target="#ajoutCompetence"/></legend>
                <c:forEach var = "competence" items = "${competencesEleve}">

                	<span class="nomCompetence">
                		#${competence.nom}
                		<div class="boutonSupprimerCompetence">
                			<img src="${pageContext.request.contextPath}/assets/images/suppr.png" class="supprBtnPetit" alt="supprXP" data-toggle="modal" data-target="#supprimerCompetence${competence.id}"/>
                		</div>
                	</span>


               		<div class="modal fade" tabindex="-1" role="dialog" id="supprimerCompetence${competence.id}">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title">Supprimer une compétence</h4>
					      </div>
					      <div class="modal-body">
					        <p>Voulez-vous vraiment supprimer votre compétence : ${competence.nom} ?</p>
					      </div>
					      <form method="post" action="">
					      	<input type="hidden" name="idCompetence" value="${competence.id}">
					      	<div class="modal-footer">
					        <button type="button" class="btn ferme" data-dismiss="modal">Annuler</button>
					        <input type="submit" name="boutonSupprimerCompetence" class="btn" value="Supprimer">
					      </div>
					      </form>
					    </div>
					  </div>
					</div>
                </c:forEach>
              </fieldset>

              <fieldset><legend class="addBtn">Intérêts:<img src="${pageContext.request.contextPath}/assets/images/plus.png" class="addBtn" alt="plusXP" name="modifInfos" data-toggle="modal" data-target="#ajoutInteret"/></legend>
               	<c:forEach var = "interet" items = "${interetsEleve}">

               		<span class="nomInteret">
               			#${interet.nom}
               			<div class="boutonSupprimerInteret">
               				<img src="${pageContext.request.contextPath}/assets/images/suppr.png" class="supprBtnPetit" alt="supprXP" data-toggle="modal" data-target="#supprimerInteret${interet.id}" />
               			</div>
               		</span>

               		<div class="modal fade" tabindex="-1" role="dialog" id="supprimerInteret${interet.id}">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title">Supprimer un intérêt</h4>
					      </div>
					      <div class="modal-body">
					        <p>Voulez-vous vraiment supprimer votre intérêt : ${interet.nom} ?</p>
					      </div>
					      <form method="post" action="">
					      	<input type="hidden" name="idInteret" value="${interet.id}">
					      	<div class="modal-footer">
					        <button type="button" class="btn ferme" data-dismiss="modal">Annuler</button>
					        <input type="submit" name="boutonSupprimerInteret" class="btn" value="Supprimer">
					      </div>
					      </form>
					    </div>
					  </div>
					</div>
                </c:forEach>
              </fieldset>
            </div>

            <div id="valid" class="tab-pane fade">
              <h2><b>Déclaration de stage</b></h2><br>
              
              <c:choose>
				<c:when test = "${etatValidation == 1}">
	   				<p>Votre déclaration de stage est en cours de traitement, nous vous répondrons dans les plus brefs délais.</p>
	   				<p>Si vous pouvez à nouveau soumettre une déclaration de stage, c'est que celle que vous avez envoyée ne convient pas. Dans ce cas, n'hésitez pas à contacter votre responsable de parcours pour plus de renseignements.</p>
				</c:when>
				<c:when test = "${etatValidation == 2}">
	   				<p>Votre déclaration de stage a été validée.</p>
				</c:when>
				<c:when test = "${etatValidation == 3}">
					<h3>Votre déclaration n'a pas été validée.</h3>
					<div>
						<u>Commentaires du responsable:</u> <c:out value="${validation.commentaires}" />
					</div>
	   				<ul class="nav nav-pills">
  							<li class="active"><a data-toggle="pill" href="#eleve">Elève</a></li>
  							<li><a data-toggle="pill" href="#entreprise">Entreprise</a></li>
  							<li><a data-toggle="pill" href="#respoStage">Responsable de stage</a></li>
  							<li><a data-toggle="pill" href="#stage">Stage</a></li>
								<li><a data-toggle="pill" href="#annexe">Annexe</a></li>
								<li><a data-toggle="pill" href="#envoieValid">Envoyer</a></li>
							</ul>

							<form method="post" action="">
								<div class="tab-content">
									<div id="eleve" class="tab-pane fade in active">
										<div class="radio">
											<label class="radio-inline"><input type="radio" name="optradio" value="A2" checked>A2</label>
											<label class="radio-inline"><input type="radio" name="optradio" value="A3">A3</label>
											<label class="radio-inline"><input type="radio" name="optradio" value="Cesure">Césure</label>
											<label class="radio-inline"><input type="radio" name="optradio" value="Msc">Msc</label>
										</div>
										<fieldset><legend>Elève:</legend>
										<input type="hidden" name="prenomEleve" value="${sessionScope.sessionUtilisateur.prenom}">
										<input type="hidden" name="nomEleve" value="${sessionScope.sessionUtilisateur.nom}">
										<input type="hidden" name="parcoursEleve" value="${sessionScope.sessionUtilisateur.idParcours}">
										<input type="hidden" name="email" value="${sessionScope.sessionUtilisateur.email}">
										<input type="hidden" name="portable" value="${sessionScope.sessionUtilisateur.portable}">
											<div class="form-group">
												<u>Nom et Prénom:</u> ${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom} <br>
											</div>
											<div class="form-group">
												<u>Parcours:</u> ${sessionScope.sessionUtilisateur.parcours}<br>
											</div>
											<div class="form-group">
				                <u>N° de sécurité sociale:</u>
				                <input class="form-control" type="text" name="numSecu" value="${validation.secu}">
				              </div>
											<div class="form-group">
				                <u>Adresse durant le stage (si différent de l'actuelle):</u>
				                <input class="form-control" type="text" name="adresse" value="${validation.adresse_eleve}">
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
									</div>

									<div id="entreprise" class="tab-pane fade">
										<fieldset><legend>Entreprise:</legend>
											<div class="form-group">
												<b>Numéro SIRET de l'Entreprise:</b>
												<input class="form-control" type="text" name="siret" value="${validation.siret}">
											</div>
											<div class="form-group">
				                <b>Code APE:</b>
				                <input class="form-control" type="text" name="ape" value="${validation.ape}">
				              </div>
											<div class="form-group">
				              	Nom de la société signataire de la convention ou du contrat:
				                <input class="form-control" type="text" name="nomEntreprise" value="${validation.nom_ent}">
				              </div>
				              				<div class="form-group">
				              	Adresse (A) de la société signataire de la convention ou du contrat:
				                <input class="form-control" type="text" name="adresseEntreprise" value="${validation.adresse1_ent}">
				              </div>
											<div class="form-group">
				              	Adresse (B) complète du lieu du stage (si différente de l'adresse A):
				                <input class="form-control" type="text" name="adresseStage" value="${validation.adresse2_ent}">
				              </div>
											<div class="form-group">
				              	Nom du service d'accueil dans la société:
				                <input class="form-control" type="text" name="nomServiceAccueil" value="${validation.nomAccueil}">
				              </div>
											<div class="form-group">
				                Standard Téléphonique <u>du lieu du stage</u>:
				                <input class="form-control" type="tel" name="telStage" value="${validation.service_accueil}">
				              </div>
											<div class="form-group">
				               	Prénom de la personne à qui il faut adresse la convention de stage le cas échéant:
				                <input class="form-control" type="text" name="prenomContactConvention"  value="${validation.rh_prenom}">
				              </div>
				              				<div class="form-group">
				                Nom de la personne à qui il faut adresse la convention de stage le cas échéant:
				                <input class="form-control" type="text" name="nomContactConvention" value="${validation.rh_nom}">
				              </div>
				              				<div class="form-group">
				                Adresse de la personne à qui il faut adresse la convention de stage le cas échéant:
				                <input class="form-control" type="text" name="adresseContactConvention" value="${validation.rh_adresse}">
				              </div>
											<div class="form-group">
				                N° de Tél.:
				                <input class="form-control" type="tel" name="telConvention" value="${validation.rh_tel}">
				              </div>
											<div class="form-group">
				                <b>Adresse e-mail:</b>
				                <input class="form-control" type="email" name="mailConvention" value="${validation.rh_mail}">
				              </div>
										</fieldset>
									</div>

									<div id="respoStage" class="tab-pane fade">
										<fieldset><legend>Responsable de stage:</legend>
											<div class="form-group">
												Nom: <input class="form-control" type="text" name="nomRespo" value="${validation.tuteur_nom}">
												Prénom: <input class="form-control" type="text" name="prenomRespo" value="${validation.rh_prenom}">
											</div>
											<div class="form-group">
												N° de Tél.:<input class="form-control" type="tel" name="telRespo" value="${validation.tuteur_tel}">
											</div>
											<div class="form-group">
												<b>Adresse e-mail:</b><input class="form-control" type="email" name="mailRespo" value="${validation.tuteur_mail}">
											</div>
											<div class="form-group">
												Fonction précise dans la société:<input class="form-control" type="text" name="fonctionRespo" value="${validation.tuteur_poste}">
											</div>
										</fieldset>
									</div>

									<div id="stage" class="tab-pane fade">
										<fieldset><legend>Stage:</legend>
											<div class="form-group">
												<b><u>Thème du stage (en une ou deux lignes) - et remplir annexe:</u></b>
												<textarea class="form-control" name="themeStage" rows="8" cols="70" value="${validation.theme_stage}"></textarea>
											</div>
											<div class="form-group">
												Date prévues pour le stage, du <input class="form-control" type="text" name="dateDebutStage" value="${validation.debut_stage}"> au <input class="form-control" type="text" name="dateFinStage" value="${validation.fin_stage}">
											</div>
											<div class="form-group">
							        	<b>Indémnité de stage en euros, mensuelle brute:</b>
							          <input class="form-control" type="text" name="indemnite" value="${validation.salaire}">
							        </div>
											<div class="form-group">
							          Avantages en nature en euros:
							        	<input class="form-control" type="text" name="avantage" value="${validation.avantage}">
							        </div>
											<div class="form-group">
												A l'étranger, Si l'indémnité est supérieur à 15% du plafond mensuel de la sécurité sociale (cad supérieure à 554,40€), la société s'engage-t-elle à assurer la couverture des risques Maladie et Accident du travail?
												<label class="radio-inline"><input type="radio" name="optradioIndemnites" value="1">Oui</label>
												<label class="radio-inline"><input type="radio" name="optradioIndemnites" value="0" checked>Non</label>
											</div>
											<div class="form-group">
							          Déplacement à l'étranger au cours du stage (effectué en France):
												<label class="radio-inline"><input type="radio" name="optradioEtranger" value="1">Oui</label>
												<label class="radio-inline"><input type="radio" name="optradioEtranger" value="0" checked>Non</label>
							        </div>
											<div class="form-group">
							          Par quel moyen vous avez trouvé ce stage:
							          <input class="form-control" type="text" name="trouveStage" value="${validation.moyen_stage}">
							        </div>
										</fieldset>
									</div>

									<div id="annexe" class="tab-pane fade">
										<fieldset><legend>Annexe à la Déclaration de Stage</legend>
											<div class="form-group">
												Présentation succinte de l'Entreprise ou du Service:
												<textarea class="form-control" name="prezEntreprise" rows="8" cols="70">${validation.presentation_ent}</textarea>
											</div>
											<div class="form-group">
												Contexte dans lequel s'intégre le stage:
												<textarea class="form-control" name="contexteStage" rows="8" cols="70">${validation.contexte_stage}</textarea>
											</div>
											<div class="form-group">
												Mission confiée au stagiaire - Objectifs:
												<textarea class="form-control" name="missionStage" rows="8" cols="70">${validation.mission}</textarea>
											</div>
											<div class="form-group">
												Si possible, principales étapes du stage:
												<textarea class="form-control" name="etapeStage" rows="8" cols="70">${validation.etapes}</textarea>
											</div>
											<div class="form-group">
												Connaissances requises:
												<textarea class="form-control" name="connaissanceReq" rows="8" cols="70">${validation.connaissances}</textarea>
											</div>
										</fieldset>
									</div>

									<div id="envoieValid" class="tab-pane fade">
										<fieldset><legend>Envoi de votre déclaration de stage:</legend>
											<p>Assurez-vous que vous avez bien rempli tous les champs de la déclaration. Nous vous donnerons une réponse dans les plus brefs délais.</p>
											<input type="submit" class="btn" name="boutonModifierValidation" value="Envoyer">
										</fieldset>
									</div>
								</div>
							</form>
				</c:when>
			    <c:otherwise>
			     	<ul class="nav nav-pills">
  							<li class="active"><a data-toggle="pill" href="#eleve">Elève</a></li>
  							<li><a data-toggle="pill" href="#entreprise">Entreprise</a></li>
  							<li><a data-toggle="pill" href="#respoStage">Responsable de stage</a></li>
  							<li><a data-toggle="pill" href="#stage">Stage</a></li>
								<li><a data-toggle="pill" href="#annexe">Annexe</a></li>
								<li><a data-toggle="pill" href="#envoieValid">Envoyer</a></li>
							</ul>

							<form method="post" action="">
								<div class="tab-content">
									<div id="eleve" class="tab-pane fade in active">
										<div class="radio">
											<label class="radio-inline"><input type="radio" name="optradio" value="A2" checked>A2</label>
											<label class="radio-inline"><input type="radio" name="optradio" value="A3">A3</label>
											<label class="radio-inline"><input type="radio" name="optradio" value="Cesure">Césure</label>
											<label class="radio-inline"><input type="radio" name="optradio" value="Msc">Msc</label>
										</div>
										<fieldset><legend>Elève:</legend>
										<input type="hidden" name="prenomEleve" value="${sessionScope.sessionUtilisateur.prenom}">
										<input type="hidden" name="nomEleve" value="${sessionScope.sessionUtilisateur.nom}">
										<input type="hidden" name="parcoursEleve" value="${sessionScope.sessionUtilisateur.idParcours}">
										<input type="hidden" name="email" value="${sessionScope.sessionUtilisateur.email}">
										<input type="hidden" name="portable" value="${sessionScope.sessionUtilisateur.portable}">
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
									</div>

									<div id="entreprise" class="tab-pane fade">
										<fieldset><legend>Entreprise:</legend>
											<div class="form-group">
												<b>Numéro SIRET de l'Entreprise:</b>
												<input class="form-control" type="text" name="siret">
											</div>
											<div class="form-group">
				                <b>Code APE:</b>
				                <input class="form-control" type="text" name="ape">
				              </div>
											<div class="form-group">
				              	Nom de la société signataire de la convention ou du contrat:
				                <input class="form-control" type="text" name="nomEntreprise">
				              </div>
				              				<div class="form-group">
				              	Adresse (A) de la société signataire de la convention ou du contrat:
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
				               	Prénom de la personne à qui il faut adresse la convention de stage le cas échéant:
				                <input class="form-control" type="text" name="prenomContactConvention">
				              </div>
				              				<div class="form-group">
				                Nom de la personne à qui il faut adresse la convention de stage le cas échéant:
				                <input class="form-control" type="text" name="nomContactConvention">
				              </div>
				              				<div class="form-group">
				                Adresse de la personne à qui il faut adresse la convention de stage le cas échéant:
				                <input class="form-control" type="text" name="adresseContactConvention">
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
									</div>

									<div id="respoStage" class="tab-pane fade">
										<fieldset><legend>Responsable de stage:</legend>
											<div class="form-group">
												Nom: <input class="form-control" type="text" name="nomRespo">
												Prénom: <input class="form-control" type="text" name="prenomRespo">
											</div>
											<div class="form-group">
												N° de Tél.:<input class="form-control" type="tel" name="telRespo">
											</div>
											<div class="form-group">
												<b>Adresse e-mail:</b><input class="form-control" type="email" name="mailRespo">
											</div>
											<div class="form-group">
												Fonction précise dans la société:<input class="form-control" type="text" name="fonctionRespo">
											</div>
										</fieldset>
									</div>

									<div id="stage" class="tab-pane fade">
										<fieldset><legend>Stage:</legend>
											<div class="form-group">
												<b><u>Thème du stage (en une ou deux lignes) - et remplir annexe:</u></b>
												<textarea class="form-control" name="themeStage" rows="8" cols="70"></textarea>
											</div>
											<div class="form-group">
												Date prévues pour le stage, du <input class="form-control" type="date" name="dateDebutStage"> au <input class="form-control" type="date" name="dateFinStage">
											</div>
											<div class="form-group">
							        	<b>Indémnité de stage en euros, mensuelle brute:</b>
							          <input class="form-control" type="text" name="indemnite">
							        </div>
											<div class="form-group">
							          Avantages en nature en euros:
							        	<input class="form-control" type="text" name="avantage">
							        </div>
											<div class="form-group">
												A l'étranger, Si l'indémnité est supérieur à 15% du plafond mensuel de la sécurité sociale (cad supérieure à 554,40€), la société s'engage-t-elle à assurer la couverture des risques Maladie et Accident du travail?
												<label class="radio-inline"><input type="radio" name="optradioIndemnites" value="1">Oui</label>
												<label class="radio-inline"><input type="radio" name="optradioIndemnites" value="0" checked>Non</label>
											</div>
											<div class="form-group">
							          Déplacement à l'étranger au cours du stage (effectué en France):
												<label class="radio-inline"><input type="radio" name="optradioEtranger" value="1">Oui</label>
												<label class="radio-inline"><input type="radio" name="optradioEtranger" value="0" checked>Non</label>
							        </div>
											<div class="form-group">
							          Par quel moyen vous avez trouvé ce stage:
							          <input class="form-control" type="text" name="trouveStage">
							        </div>
										</fieldset>
									</div>

									<div id="annexe" class="tab-pane fade">
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
									</div>

									<div id="envoieValid" class="tab-pane fade">
										<fieldset><legend>Envoi de votre déclaration de stage:</legend>
											<p>Assurez-vous que vous avez bien rempli tous les champs de la déclaration. Nous vous donnerons une réponse dans les plus brefs délais.</p>
											<input type="submit" class="btn" name="envoyerValidation" value="Envoyer">
										</fieldset>
									</div>
								</div>
							</form>

            
			    </c:otherwise>
			  </c:choose>

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
              <button type="button" class="btn">Envoyer</button>
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
                        	<button type="button" class="btn ferme" data-dismiss="modal">Fermer</button>
                        	<input type="submit" class="btn" name="boutonAjoutExperienceEleve" value="Ajouter">
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
                    <h4 class="modal-title" id="myModalLabel">Ajouter une compétence</h4>
	                    <div class="modal-body">
	                    	<form method="post" action="">
		                        <div class="form-group">
			                        <p class="ajoutExperienceDiv">
			                       		<select class="form-control selectComp" name="competence">
		              						<c:forEach var = "competence" items = "${competences}">
		                					<option value = "${competence.id}" > ${competence.nom} </option>
		              						</c:forEach>
		            					</select>
		            					<input type="submit" class="btn" name="boutonAjoutCompetenceEleve" value="Ajouter">
			                        </p>
		                        </div>
	                        </form>
	                        <form method="post" action="">
		                        <div class="form-group">
			                        <h4 class="modal-title" id="myModalLabel">Ou ajoutez-en une si elle n'apparaît pas ci-dessus !</h4>
			                        <p class="ajoutExperienceDiv">
			                        	<input type="text" class="form-control ajoutComp" name="newCompetenceBdd" value="">
										<input type="submit" class="btn" name="boutonAjoutCompetenceEleveBdd" value="Ajouter">
			                        </p>
		                        </div>
	                        </form>
	                  	</div>
                  </div>
                </div>
              </div>
            </div>

	        <div class="modal fade" id="deconnexion" tabindex="-1" role="dialog">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">Déconnexion</h4>
			      </div>
			      <div class="modal-body">
			        <p>Voulez-vous vraiment vous déconnecter ?</p>
			      </div>
			      <form method="post" action="">
			      	<div class="modal-footer">
			        <button type="button" class="btn" data-dismiss="modal">Annuler</button>
			        <input type="submit" name="boutonDeconnexion" class="btn deco" value="Se déconnecter" style="opacity:0.9;">
			      </div>
			      </form>
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
                        	<button type="button" class="btn ferme" data-dismiss="modal">Fermer</button>
                        	<input type="submit" class="btn" name="boutonAjoutInteretEleve" value="Ajouter">
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
						<div class="row">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
								<img src="${pageContext.request.contextPath}\assets\images\logo-isemploi.png" class="logoIsemploi" alt="logo Isemploi">
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
								Copyright (c) 2016 Isemploi by ISEP. Tous droits réservés.
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
								<img src="${pageContext.request.contextPath}\assets\images\logo-isep.png" class="logoIsep" alt="logo ISEP">
							</div>
						</div>
					</footer>
        </section>
      </div>
    </div>
	</body>
</html>
