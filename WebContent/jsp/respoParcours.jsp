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
              <button type="button" class="btn btn-primary" name="modifInfos" data-toggle="modal" data-target="#modifInfoRP" style="opacity:0.9;">Modifier infos</button>
              <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deconnexion" style="opacity:0.9;">Déconnexion</button>

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
	                        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
	                        <input type="submit" name="boutonModifInfosRespos" class="btn btn-primary" value="Modifier">
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
		        				<button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
		       					<input type="submit" name="boutonDeconnexion" class="btn btn-danger" value="Se déconnecter" style="opacity:0.9;">
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
						<li class="active"><a data-toggle="pill" href="#valid${validation.id}">
							<b>${validation.prenomEleve} ${validation.nomEleve}</b><br>
							Stage chez ${validation.nom_ent}
							</a></li>
                	</c:forEach>
                </ul>
                
              </div>

              <section class="col-sm-9">
                <div class="tab-content">
                	<c:forEach var = "validation" items = "${validations}">
                	
                		<div id="valid${validation.id}"class="tab-pane fade in active">

		                    <p>
		                      <u>Entreprise:</u> ${validation.nom_ent} <br>
		                      <br>
		                      <u>Nom du responsable:</u> ${validation.tuteur_prenom} ${validation.tuteur_nom} <br>
		                      <br>
		                      <u>Descriptif de la mission:</u> <br>
		                      <br>
		                      ${validation.mission}<br>
		                      <br>
		                      <u>Validation:</u>
		
		                      <div class="buttons">
		                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/checked.png" class="btnValid" alt="valid"/></a>
		                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/question.png" class="btnValid" alt="details" data-toggle="modal" data-target="#detailsModal"/></a>
		                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/cancel.png" class="btnValid" alt="annule"/></a>
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
		                                <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
		                                <button type="button" class="btn btn-primary">Envoyer</button>
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
