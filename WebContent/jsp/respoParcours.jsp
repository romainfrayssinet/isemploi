<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styleRP.css">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <title>Responsable Parcours</title>
  </head>

  <body>

    <div class="row">
  		<nav class="col-lg-12">
  			<div class="container">
  					<section class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
  					</section>
  					<section class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
              <ul class="nav nav-tabs nav-justified">
                <li class="bar active"><a href="#accueil">Accueil</a></li>
                <li class="bar"><a href="#valid">Validation</a></li>
                <li class="bar"><a href="#eleves">Élèves</a></li>
              </ul>
  					</section>
  				</div>
  			</nav>
  		</div>

    <div class="container">

      <div class="row">
        <nav class="col-lg-3">
          <img src="${pageContext.request.contextPath}/assets/photosProfil/respoParcours.jpg" style="margin: auto;" class="img-rounded img-responsive" alt="imageRespo">

          <h2>${sessionScope.sessionUtilisateur.prenom} ${sessionScope.sessionUtilisateur.nom}</h2>

          <div class="infos">
			<c:choose>
				<c:when test = "${ empty sessionScope.sessionUtilisateur.profession }">
	   				<p>Indiquez votre profession !<p>
				</c:when>
			    <c:otherwise>
			     	<p>${sessionScope.sessionUtilisateur.profession}</p>
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
				<c:when test = "${ empty sessionScope.sessionUtilisateur.parcours}">
	   				<p>A quel parcours êtes-vous rattaché(e) ?<p>
				</c:when>
			    <c:otherwise>
              		<p>Parcours ${sessionScope.sessionUtilisateur.parcours}</p>
			    </c:otherwise>
			</c:choose>
              <button type="button" class="btn" name="modifInfos" data-toggle="modal" data-target="#modifInfoRP">Modifier infos</button>
              <button type="button" class="btn deco" data-toggle="modal" data-target="#deconnexion">Déconnexion</button>

              <div class="modal fade" id="modifInfoRP" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                      <h4 class="modal-title" id="myModalLabel">Modifier vos informations</h4>
                      <form method="post" action="">
	                      <div class="modal-body">
	                        <div class="form-group">
	                          <label for="profession">Modifier votre profession:</label>
	                          <input type="text" class="form-control" name="newProfession" value="${sessionScope.sessionUtilisateur.profession}">
	                        </div>
	                        <div class="form-group">
	                          <label for="lieu">Modifier le lieu où vous travaillez:</label>
	                          <input type="text" class="form-control" name="newLieu" value="${sessionScope.sessionUtilisateur.lieuTravail}">
	                        </div>
	                        <div class="form-group">
	                          <label for="parcours">A quel parcours êtes-vous rattaché(e) ?</label>
		                       	<p class="ajoutExperienceDiv">
		                       		<select class="form-control selectComp" name="newParcours">
		             					<c:forEach var = "unParcours" items = "${parcours}">
		               						<option value = "${unParcours.id}" > ${unParcours.nom} </option>
		             					</c:forEach>
		           					</select>
		                        </p>
	                        </div>
	                      </div>
	                      <div class="modal-footer">
	                        <button type="button" class="btn ferme" data-dismiss="modal">Fermer</button>
	                        <input type="submit" name="boutonModifInfosRespos" class="btn" value="Modifier">
	                      </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>

	          <div class="modal fade" tabindex="-1" role="dialog" id="deconnexion">
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
		        				<button type="button" class="btn ferme" data-dismiss="modal">Annuler</button>
		       					<input type="submit" name="boutonDeconnexion" class="btn deco" value="Se déconnecter">
		      				</div>
		      			</form>
			    	</div>
				  </div>
				</div>

          </div>
        </nav>

        <section class="col-lg-9">
          <div class="tab-content">

            <div id="accueil" class="tab-pane fade in active">
              <h2>Où en êtes vous ?</h2>

              <div class="col-lg-6">
                <div class="c100 p0" id="div_loading_progress">
                  <h1><span id="span_progress">0%</span></h1>
                </div>
                <p>de vos élèves ont validé leur stage</p>
              </div>

              <div class="col-lg-6">
                <div class="c100 p0" id="div_loading_progress"><h1><span id="span_progress2">0%</span></h1></div>
                <p>des élèves de la promo 2018 ont validé leur stage</p>
              </div>
            </div>

            <div id="eleves" class="tab-pane fade">
              	<h2>Élèves</h2>
              	<div class="row">
	              	<c:forEach var = "eleve" items = "${eleves}">
		              	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
              				<a href="${pageContext.request.contextPath}/profil?login=${eleve.login}"><img class="img-rounded img-responsive petitesPhotosProfil" src="http://storage.iseplive.fr/avatars/${eleve.debutNumero}/${eleve.numero}.jpg" alt="valid"/></a>
              				<a href="${pageContext.request.contextPath}/profil?login=${eleve.login}"><c:out value = "${eleve.prenom} ${eleve.nom}" /></a>
		              	</div>
					        </c:forEach>
              	</div>

            </div>

            <div id="valid" class="tab-pane fade">

              <div class="col-sm-3">
                <ul class="nav nav-pills nav-stacked ">
					<c:forEach var = "validation" items = "${validations}">
						<li class=""><a data-toggle="pill" href="#valid${validation.id}">
							<b>${validation.prenomEleve} ${validation.nomEleve}</b><br>
							Stage chez ${validation.nom_ent}
							</a></li>
                	</c:forEach>
                </ul>

              </div>

              <section class="col-sm-9">
                <div class="tab-content">
                	<c:forEach var = "validation" items = "${validations}">

                		<div id="valid${validation.id}"class="tab-pane fade">

                      <h2><b>Déclaration de stage</b></h2><br>

                      <%-- <c:choose>
                <c:when test = "${etatValidation == 1}">
                    <p>Votre déclaration de stage est en cours de traitement, nous vous répondrons dans les plus brefs délais.</p>
                    <p>Si vous pouvez à nouveau soumettre une déclaration de stage, c'est que celle que vous avez envoyée ne convient pas. Dans ce cas, n'hésitez pas à contacter votre responsable de parcours pour plus de renseignements.</p>
                </c:when>
                <c:when test = "${etatValidation == 2}">
                    <p>Votre déclaration de stage a été validée.</p>
                </c:when> --%>



                  <%-- <c:otherwise> --%>
                    <ul class="nav nav-pills">
                        <li class="active"><a data-toggle="pill" href="#eleve">Elève</a></li>
                        <li><a data-toggle="pill" href="#entreprise">Entreprise</a></li>
                        <li><a data-toggle="pill" href="#respoStage">Responsable de stage</a></li>
                        <li><a data-toggle="pill" href="#stage">Stage</a></li>
                        <li><a data-toggle="pill" href="#annexe">Annexe</a></li>
                        <li><a data-toggle="pill" href="#validDecla">Envoyer</a></li>
                      </ul>

                      <form method="post" action="">
                        <div class="tab-content">
                          <div id="eleve" class="tab-pane fade in active">
                            <div class="form-group">
                              <u>Type de stage:</u> ${validation.annee}<br>
                            </div>
                            <fieldset><legend>Elève:</legend>
                                <u>Nom et Prénom:</u> ${validation.nomEleve} ${validation.prenomEleve} <br>
                              </div>
                              <div class="form-group">
                                <u>Parcours:</u> ${validation.parcoursEleve}<br>
                              </div>
                              <div class="form-group">
                                <u>N° de sécurité sociale:</u>
                                ${validation.secu}
                              </div>
                              <div class="form-group">
                                <u>Adresse durant le stage (si différent de l'actuelle):</u>
                                ${validation.adresse_eleve}
                              </div>
                              <div class="form-group">
                                <u>Adresse e-mail:</u>
                                ${validation.email_eleve}
                              </div>
                              <div class="form-group">
                                <u>Tél. portable:</u>
                                ${validation.tel_eleve}
                              </div>
                            </fieldset>
                          </div>

                          <div id="entreprise" class="tab-pane fade">
                            <fieldset><legend>Entreprise:</legend>
                              <div class="form-group">
                                <b>Numéro SIRET de l'Entreprise:</b>
                                ${validation.siret}
                              </div>
                              <div class="form-group">
                                <b>Code APE:</b>
                                ${validation.ape}
                              </div>
                              <div class="form-group">
                                Nom de la société signataire de la convention ou du contrat:
                                ${validation.nom_ent}
                              </div>
                                      <div class="form-group">
                                Adresse (A) de la société signataire de la convention ou du contrat:
                                ${validation.adresse1_ent}
                              </div>
                              <div class="form-group">
                                Adresse (B) complète du lieu du stage (si différente de l'adresse A):
                                ${validation.adresse2_ent}
                              </div>
                              <div class="form-group">
                                Nom du service d'accueil dans la société:
                                ${validation.nomAccueil}
                              </div>
                              <div class="form-group">
                                Standard Téléphonique <u>du lieu du stage</u>:
                                ${validation.service_accueil}
                              </div>
                              <div class="form-group">
                                Prénom de la personne à qui il faut adresse la convention de stage le cas échéant:
                                ${validation.rh_prenom}
                              </div>
                              <div class="form-group">
                                Nom de la personne à qui il faut adresse la convention de stage le cas échéant:
                                ${validation.rh_nom}
                              </div>
                              <div class="form-group">
                                Adresse de la personne à qui il faut adresse la convention de stage le cas échéant:
                                ${validation.rh_adresse}
                              </div>
                              <div class="form-group">
                                N° de Tél.:
                                ${validation.rh_tel}
                              </div>
                              <div class="form-group">
                                <b>Adresse e-mail:</b>
                                ${validation.rh_mail}
                              </div>
                            </fieldset>
                          </div>

                          <div id="respoStage" class="tab-pane fade">
                            <fieldset><legend>Responsable de stage:</legend>
                              <div class="form-group">
                                Nom: ${validation.tuteur_nom}<br>
                                Prénom: ${validation.tuteur_prenom}
                              </div>
                              <div class="form-group">
                                N° de Tél.:${validation.tuteur_tel}
                              </div>
                              <div class="form-group">
                                <b>Adresse e-mail:</b>${validation.tuteur_mail}
                              </div>
                              <div class="form-group">
                                Fonction précise dans la société:${validation.tuteur_poste}
                              </div>
                            </fieldset>
                          </div>

                          <div id="stage" class="tab-pane fade">
                            <fieldset><legend>Stage:</legend>
                              <div class="form-group">
                                <b><u>Thème du stage:</u></b>
                                ${validation.theme_stage}
                              </div>
                              <div class="form-group">
                                Date prévues pour le stage: du ${validation.debut_stage} au ${validation.fin_stage}
                              </div>
                              <div class="form-group">
                                <b>Indémnité de stage en euros, mensuelle brute:</b>
                                ${validation.salaire}
                              </div>
                              <div class="form-group">
                                Avantages en nature en euros:
                                ${validation.avantage}
                              </div>
                              <div class="form-group">
                                A l'étranger, Si l'indémnité est supérieur à 15% du plafond mensuel de la sécurité sociale (cad supérieure à 554,40€), la société s'engage-t-elle à assurer la couverture des risques Maladie et Accident du travail?
                                ${validation.indemnite_etranger}
                              </div>
                              <div class="form-group">
                                Déplacement à l'étranger au cours du stage (effectué en France):
                                ${validation.deplacement_etranger}
                              </div>
                              <div class="form-group">
                                Moyen par lequel l'élève a trouvé ce stage:
                                ${validation.moyen_stage}
                              </div>
                            </fieldset>
                          </div>

                          <div id="annexe" class="tab-pane fade">
                            <fieldset><legend>Annexe à la Déclaration de Stage</legend>
                              <div class="form-group">
                                Présentation succinte de l'Entreprise ou du Service:<br>
                                <${validation.presentation_ent}
                              </div>
                              <div class="form-group">
                                Contexte dans lequel s'intégre le stage:<br>
                                ${validation.contexte_stage}
                              </div>
                              <div class="form-group">
                                Mission confiée au stagiaire - Objectifs:<br>
                                ${validation.mission}
                              </div>
                              <div class="form-group">
                                Si possible, principales étapes du stage:<br>
                                ${validation.etapes}
                              </div>
                              <div class="form-group">
                                Connaissances requises:<br>
                                ${validation.connaissances}
                              </div>
                            </fieldset>
                          </div>

                          <div id="validDecla" class="tab-pane fade">
                            <fieldset><legend>Valider la déclaration:</legend>
                              <<div class="buttons">
    		                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/checked.png" class="btnValid" alt="valid" data-toggle="modal" data-target="#accepter${validation.id}"/></a>
    		                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/question.png" class="btnValid" alt="details" data-toggle="modal" data-target="#detailsModal"/></a>
    		                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/cancel.png" class="btnValid" alt="annule"/></a>
    		                      </div>
                            </fieldset>
                          </div>
                        </div>
                      </form>


                  <%-- </c:otherwise>
                </c:choose> --%>
		          <p>
		            <div class="modal fade" tabindex="-1" role="dialog" id="accepter${validation.id}">
						 		 <div class="modal-dialog" role="document">
						    		<div class="modal-content">
						      			<div class="modal-header">
						        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        			<h4 class="modal-title">Validation la déclaration de Stage</h4>
						      			</div>
						      			<div class="modal-body">
						        			<p>Voulez-vous vraiment valider cette déclaration de Stage ?</p>
						      			</div>
						      			<form method="post" action="">
						      				<input type="hidden" name="idValidation" value="${validation.id}">
						      				<div class="modal-footer">
						        				<button type="button" class="btn ferme" data-dismiss="modal">Annuler</button>
						       					<input type="submit" name="boutonAccepterValidationStage" class="btn" value="Validation">
						      				</div>
						      			</form>
							    	</div>
								  </div>
							  </div>


		                      <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="detailsModal">
		                        <div class="modal-dialog" role="document">
		                          <div class="modal-content">
		                            <div class="modal-header">
		                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                              <h4 class="modal-title" id="myModalLabel">Demandez plus de détails sur ce stage</h4>
		                              <div class="modal-body">
		                                <div class="form-group">
		                                  <label for="destinataire">Destinataire:</label>
		                                  william.duvant@isep.fr
		                                </div>
		                                <div class="form-group">
		                                  <label for="obj">Objet de votre message:</label>
		                                  <input class="form-control" type="text" name="obj">
		                                </div>
		                                <div class="form-group">
		                                  <label for="mail">Message:</label>
		                                  <textarea class="form-control" name="mail" rows="8" cols="70"></textarea>
		                                </div>
		                              </div>
		                              <div class="modal-footer">
		                                <button type="button" class="btn ferme" data-dismiss="modal">Fermer</button>
		                                <button type="button" class="btn">Envoyer</button>
		                              </div>
		                            </div>
		                          </div>
		                        </div>

		                      </div>
		                    </p>
                  		</div>
                	</c:forEach>
                </div>
              </section>
            </div>
          </div>
        </section>
      </div>
    </div>
  </body>

  <script>
    var pct = 0,
    span_progress = document.getElementById("span_progress"),
    div_loading_progress = document.getElementById("div_loading_progress");

    function display_pct(p) {
      span_progress.innerHTML=""+p+"%";
      div_loading_progress.className="c100 p"+p;
    }

    function update_pct(){
      display_pct(pct++);
      if (pct<=63) {
          setTimeout(update_pct,30);
      }
    }

    setTimeout(update_pct,100);

    var prct = 0,
    span_progress2 = document.getElementById("span_progress2"),
    div_loading_progress = document.getElementById("div_loading_progress");


    function display_prct(p1) {
      span_progress2.innerHTML=""+p1+"%";
      div_loading_progress.className="c100 p0"+p1;
    }

    function update_prct(){
      display_prct(prct++);
      if (prct<=41) {
          setTimeout(update_prct,30);
      }
    }

    setTimeout(update_prct,100);

    $(document).ready(function(){
        $(".nav-tabs a").click(function(){
            $(this).tab('show');
        });
    });
  </script>

</html>
