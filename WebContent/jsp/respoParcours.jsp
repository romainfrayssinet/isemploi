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
  					<img src="${pageContext.request.contextPath}\assets\images\logo-isemploi.png" class="logoIsemploi" alt="logo Isemploi">
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
                <p>des élèves de votre parcours ont validé leur stage</p>
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
						<li><a data-toggle="pill" href="#valid${validation.id}">
							<b>${validation.prenomEleve} ${validation.nomEleve}</b><br>
							Stage chez ${validation.nom_ent}
							</a></li>
                	</c:forEach>
                </ul>

              </div>
              
              
               <section class="col-sm-9">
                 <div class="tab-content">
                 	<c:forEach var = "validation" items = "${validations}">
                   		<div id="valid${validation.id}"class="tab-pane fade in">
                   		
                   		<ul class="nav nav-pills">
                        	<li class="active"><a data-toggle="pill" href="#eleve${validation.id}">Elève</a></li>
                        	<li><a data-toggle="pill" href="#entreprise${validation.id}">Entreprise</a></li>
                        	<li><a data-toggle="pill" href="#respoStage${validation.id}">Responsable de stage</a></li>
                        	<li><a data-toggle="pill" href="#stage${validation.id}">Stage</a></li>
                        	<li><a data-toggle="pill" href="#annexe${validation.id}">Annexe</a></li>
                        	<li><a data-toggle="pill" href="#validDecla${validation.id}">Valider</a></li>
                     	</ul>
                   		
                   			<h2><b>Déclaration de stage</b></h2><br>
                   			
                   			<div class="tab-content">
                   			
                   				<div id="eleve${validation.id}" class="tab-pane fade in active">
	                   			<fieldset><legend>Elève:</legend>
	                                <u>Nom et Prénom:</u> ${validation.nomEleve} ${validation.prenomEleve} <br>
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
                            
                            <div id="entreprise${validation.id}" class="tab-pane fade">
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
	                                <u>Nom de la société signataire de la convention ou du contrat:</u>
	                                ${validation.nom_ent}
	                              </div>
	                                      <div class="form-group">
	                                <u>Adresse (A) de la société signataire de la convention ou du contrat:</u>
	                                ${validation.adresse1_ent}
	                              </div>
	                              <div class="form-group">
	                                <u>Adresse (B) complète du lieu du stage (si différente de l'adresse A):</u>
	                                ${validation.adresse2_ent}
	                              </div>
	                              <div class="form-group">
	                                <u>Nom du service d'accueil dans la société:</u>
	                                ${validation.nomAccueil}
	                              </div>
	                              <div class="form-group">
	                                <u>Standard Téléphonique du lieu du stage:</u>
	                                ${validation.service_accueil}
	                              </div>
	                              <div class="form-group">
	                                <u>Prénom de la personne à qui il faut adresse la convention de stage le cas échéant:</u>
	                                ${validation.rh_prenom}
	                              </div>
	                                      <div class="form-group">
	                                <u>Nom de la personne à qui il faut adresse la convention de stage le cas échéant:</u>
	                                ${validation.rh_nom}
	                              </div>
	                                      <div class="form-group">
	                                <u>Adresse de la personne à qui il faut adresse la convention de stage le cas échéant:</u>
	                                ${validation.rh_adresse}
	                              </div>
	                              <div class="form-group">
	                                <u>N° de Tél.:</u>
	                                ${validation.rh_tel}
	                              </div>
	                              <div class="form-group">
	                                <u><b>Adresse e-mail:</b></u>
	                                ${validation.rh_mail}
	                              </div>
	                            </fieldset>
                            </div>
                            
                            <div id="respoStage${validation.id}" class="tab-pane fade">
	                   			<fieldset><legend>Responsable de stage:</legend>
	                              <div class="form-group">
	                                <u>Nom:</u> ${validation.tuteur_nom}<br>
	                                <u>Prénom:</u> ${validation.tuteur_prenom}
	                              </div>
	                              <div class="form-group">
	                                <u>N° de Tél.:</u>${validation.tuteur_tel}
	                              </div>
	                              <div class="form-group">
	                                <b>Adresse e-mail:</b>${validation.tuteur_mail}
	                              </div>
	                              <div class="form-group">
	                                <u>Fonction précise dans la société:</u>${validation.tuteur_poste}
	                              </div>
	                            </fieldset>
                            </div>
                            
                            <div id="stage${validation.id}" class="tab-pane fade">
	                            <fieldset><legend>Stage:</legend>
	                              <div class="form-group">
	                                <b><u>Thème du stage:</u></b>
	                                ${validation.theme_stage}
	                              </div>
	                              <div class="form-group">
	                                <u>Date prévues pour le stage:</u> du ${validation.debut_stage} au ${validation.fin_stage}
	                              </div>
	                              <div class="form-group">
	                                <b>Indémnité de stage en euros, mensuelle brute:</b>
	                                ${validation.salaire}
	                              </div>
	                              <div class="form-group">
	                                <u>Avantages en nature en euros:</u>
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
	                                <u>Moyen par lequel l'élève a trouvé ce stage:</u>
	                                ${validation.moyen_stage}
	                              </div>
	                            </fieldset>
                            </div>
                            
                            <div id="annexe${validation.id}" class="tab-pane fade">
	                             <fieldset><legend>Annexe à la Déclaration de Stage</legend>
	                              <div class="form-group">
	                                <u>Présentation succinte de l'Entreprise ou du Service:</u><br>
	                                ${validation.presentation_ent}
	                              </div>
	                              <div class="form-group">
	                                <u>Contexte dans lequel s'intégre le stage:</u><br>
	                                ${validation.contexte_stage}
	                              </div>
	                              <div class="form-group">
	                                <u>Mission confiée au stagiaire - Objectifs:</u><br>
	                                ${validation.mission}
	                              </div>
	                              <div class="form-group">
	                                <u>Si possible, principales étapes du stage:</u><br>
	                                ${validation.etapes}
	                              </div>
	                              <div class="form-group">
	                                <u>Connaissances requises:</u><br>
	                                ${validation.connaissances}
	                              </div>
	                            </fieldset>
                            </div>
                            
                            <div id="validDecla${validation.id}" class="tab-pane fade">
	                            <fieldset><legend>Valider la déclaration:</legend>
			                      <div class="buttons">
			                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/checked.png" class="btnValid" alt="valid" data-toggle="modal" data-target="#accepter${validation.id}"/></a>
			                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/question.png" class="btnValid" alt="details" data-toggle="modal" data-target="#detailsModal${validation.id}"/></a>
			                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/cancel.png" class="btnValid" alt="annule" data-toggle="modal" data-target="#refuser${validation.id}"/></a>
			                      </div>
	                            </fieldset>
                            </div>
                            
                            <div class="modal fade" tabindex="-1" role="dialog" id="accepter${validation.id}">
						 		 <div class="modal-dialog" role="document">
						    		<div class="modal-content">
						      			<div class="modal-header">
						        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        			<h4 class="modal-title">Validation de la déclaration de Stage</h4>
						      			</div>
						      			<div class="modal-body">
						        			<p>Voulez-vous vraiment valider cette déclaration de Stage ?</p>
						      			</div>
						      			<form method="post" action="">
						      				<input type="hidden" name="idValidation" value="${validation.id}">
						      				<div class="modal-footer">
						        				<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
						       					<input type="submit" name="boutonAccepterValidationStage" class="btn" value="Valider" style="opacity:0.9;">
						      				</div>
						      			</form>
							    	</div>
								  </div>
							</div>
							  
							<div class="modal fade" tabindex="-1" role="dialog" id="refuser${validation.id}">
						 		 <div class="modal-dialog" role="document">
						    		<div class="modal-content">
						      			<div class="modal-header">
						        			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        			<h4 class="modal-title">Refus de la déclaration de Stage</h4>
						      			</div>
						      			<div class="modal-body">
						        			<p>Voulez-vous vraiment refuser cette déclaration de Stage ?</p>
						      			</div>
						      			<form method="post" action="">
						      				<input type="hidden" name="idValidation" value="${validation.id}">
						      				<div class="modal-footer">
						        				<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
						       					<input type="submit" name="boutonRefuserValidationStage" class="btn" value="Refuser" style="opacity:0.9;">
						      				</div>
						      			</form>
							    	</div>
								  </div>
							  </div> 
							  
                   			<div class="modal fade" id="detailsModal${validation.id}" tabindex="-1" role="dialog">
		                        <div class="modal-dialog" role="document">
		                          <div class="modal-content">
		                            <div class="modal-header">
		                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		                              <h4 class="modal-title">Demander plus de détails sur ce stage</h4>
		                              <form method="post" action="">
		                              	<div class="modal-body">
			                              	${validation.prenomEleve} ${validation.nomEleve} devra soumettre sa candidature à nouveau en prenant en compte vos commentaires.
			                              	Vous n'aurez pas accès à cette validation de stage tant qu'il n'aura pas soumis à nouveau le formulaire.
			                                <div class="form-group">
			                                  <label for="mail">Commentaires:</label>
			                                  <textarea class="form-control" name="commentairesValidation" rows="8" cols="70"></textarea>
			                                </div>
			                              </div>
			                              <div class="modal-footer">
			                              	<input type="hidden" name="idValidation" value="${validation.id}">
			                                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
			                                <input type="submit" name="boutonCommentairesValidationStage" class="btn" value="Envoyer" style="opacity:0.9;">
			                             </div>
		                              </form>
		                            </div>
		                          </div>
		                        </div>
		                     </div>
                   			
                   			</div>
                   			
                   			
                   		</div>
                   	</c:forEach>
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
      if (pct<= <c:out value="${poucentageEleveStage}"/>) {
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
