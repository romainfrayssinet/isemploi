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
                <li class="active"><a href="#accueil">Accueil</a></li>
                <li><a href="#valid">Validation</a></li>
                <li><a href="#eleves">Élèves</a></li>
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
			              	<table>
			              		<tr>
			            			<td>
			              				<a href="${pageContext.request.contextPath}/profil?login=${eleve.login}"><img class="img-rounded img-responsive petitesPhotosProfil" src="http://storage.iseplive.fr/avatars/${eleve.debutNumero}/${eleve.numero}.jpg" alt="valid"/></a>
			              			</td>
			              			<td>
			              				<a href="${pageContext.request.contextPath}/profil?login=${eleve.login}"><c:out value = "${eleve.prenom} ${eleve.nom}" /></a>
			              			</td>
			              		</tr>
			              	</table>
		              	</div>		
					</c:forEach>
              	</div>

            </div>

            <div id="valid" class="tab-pane fade">

              <div class="col-sm-3">
                <ul class="nav nav-pills nav-stacked ">
                <li class="active"><a data-toggle="pill" href="#valid1">
                  <b>William Duvant</b><br>
                  Stage chez Ubisoft
                </a></li>
                  <li><a data-toggle="pill" href="#valid2">
                    <b>William Duvant</b><br>
                    Stage chez Ubisoft
                  </a></li>
                  <li><a data-toggle="pill" href="#valid3">
                    <b>William Duvant</b><br>
                    Stage chez Ubisoft
                  </a></li>
                </ul>
              </div>

              <section class="col-sm-9">
                <div class="tab-content">
                  <div id="valid1"class="tab-pane fade in active">

                    <p>
                      <u>Entreprise:</u> Ubisoft <br>
                      <br>
                      <u>Intitulé du poste:</u> Assistant chef de projet IT <br>
                      <br>
                      <u>Nom du responsable:</u> Paul Steimberger <br>
                      <br>
                      <u>Descriptif de la mission:</u> <br>
                      <br>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam  fringilla ullamcorper orci, ut blandit erat pretium sed. Aliquam  vulputate magna condimentum quam semper volutpat et eget erat. Maecenas  placerat purus nec eros consectetur, vel vulputate ipsum tincidunt.  Aliquam quis porta mauris, sit amet accumsan tortor. <br>
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

                  <div id="valid2"class="tab-pane fade">
                    <p>
                      <u>Entreprise:</u> Ubisoft <br>
                      <br>
                      <u>Intitulé du poste:</u> Assistant chef de projet IT <br>
                      <br>
                      <u>Nom du responsable:</u> Paul Steimberger <br>
                      <br>
                      <u>Descriptif de la mission:</u> <br>
                      <br>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam  fringilla ullamcorper orci, ut blandit erat pretium sed. Aliquam  vulputate magna condimentum quam semper volutpat et eget erat. Maecenas  placerat purus nec eros consectetur, vel vulputate ipsum tincidunt.  Aliquam quis porta mauris, sit amet accumsan tortor. <br>
                      <br>
                      <u>Validation:</u>
                        <div class="buttons">
                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/checked.png" class="btnValid" alt="valid"/></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/question.png" class="btnValid" alt="details" data-toggle="modal" data-target="#detailsModal"/></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/cancel.png" class="btnValid" alt="annule"/></a>
                        </div>
                    </p>
                  </div>

                  <div id="valid3"class="tab-pane fade">
                    <p>
                      <u>Entreprise:</u> Ubisoft <br>
                      <br>
                      <u>Intitulé du poste:</u> Assistant chef de projet IT <br>
                      <br>
                      <u>Nom du responsable:</u> Paul Steimberger <br>
                      <br>
                      <u>Descriptif de la mission:</u> <br>
                      <br>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam  fringilla ullamcorper orci, ut blandit erat pretium sed. Aliquam  vulputate magna condimentum quam semper volutpat et eget erat. Maecenas  placerat purus nec eros consectetur, vel vulputate ipsum tincidunt.  Aliquam quis porta mauris, sit amet accumsan tortor. <br>
                      <br>
                      <u>Validation:</u>
                        <div class="buttons">
                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/checked.png" class="btnValid" alt="valid"/></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/question.png" class="btnValid" alt="details" data-toggle="modal" data-target="#detailsModal"/></a>
                        <a href="#"><img src="${pageContext.request.contextPath}/assets/images/cancel.png" class="btnValid" alt="annule"/></a>
                        </div>
                    </p>
                  </div>

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
