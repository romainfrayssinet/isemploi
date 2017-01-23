package com.isemploi.controleurs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.isemploi.beans.Utilisateur;
import com.isemploi.modeles.Eleves;
import com.isemploi.modeles.Responsables;
import com.isemploi.modeles.Utilisateurs;

/**
 * Servlet implementation class controlleurAccueil
 */


@WebServlet(name="Accueil", urlPatterns={"/accueil"})
public class ControleurAccueil extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleurAccueil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("sessionUtilisateur") == null){
			response.sendRedirect("connexion");
		} else {
			
			if (((Utilisateur) session.getAttribute("sessionUtilisateur")).getStatut().equals("eleve")){
				request.setAttribute("parcours", Utilisateurs.recupererParcours());
				request.setAttribute("etatValidation", Eleves.recupererEtatValidation(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("competences", Eleves.recupererCompetences(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("experiences", Eleves.recupererExperiences(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("interetsEleve", Eleves.recupererInterets(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("competencesEleve", Eleves.recupererCompetencesEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("validation", Eleves.recupererValidationEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				this.getServletContext().getRequestDispatcher( "/jsp/eleve.jsp" ).forward(request, response);
			} else{
				request.setAttribute("validations", Responsables.recupererValidations(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("parcours", Utilisateurs.recupererParcours());
				request.setAttribute("eleves", Eleves.recupererEleves());
				this.getServletContext().getRequestDispatcher( "/jsp/respoParcours.jsp" ).forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (request.getParameter("boutonModifInfosEleve") != null){
			Eleves.modifierInfosEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("newStatut"), Integer.parseInt(request.getParameter("newParcours")), request.getParameter("newLieu"), request.getParameter("newRecherche"), request.getParameter("newPromo"), request.getParameter("newPhone"), request.getParameter("newLinkedin"));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonAjoutExperienceEleve") != null){
			Eleves.ajouterExperienceEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("type"), request.getParameter("entreprise"), request.getParameter("poste"), request.getParameter("duree"), request.getParameter("description"));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if(request.getParameter("boutonAjoutCompetenceEleve")!= null){
			Eleves.ajouterCompetenceEleve(Integer.parseInt(request.getParameter("competence")), ((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin());
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if(request.getParameter("boutonAjoutCompetenceEleveBdd")!= null){
			Eleves.ajouterCompetenceBDD(request.getParameter("newCompetenceBdd"));
			int idCompetence = Eleves.recupererIdCompetenceByName(request.getParameter("newCompetenceBdd"));
			Eleves.ajouterCompetenceEleve(idCompetence, ((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin());
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonAjoutInteretEleve") != null){
			Eleves.ajouterInteretEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("newInteret"));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonModifInfosRespos") != null){
			Responsables.modifierInfosRespos(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("newProfession"), request.getParameter("newLieu"), Integer.parseInt(request.getParameter("newParcours")));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonAccepterValidationStage") != null){
			Responsables.accepterValidation(Integer.parseInt(request.getParameter("idValidation")));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonRefuserValidationStage") != null){
			Responsables.refuserValidation(Integer.parseInt(request.getParameter("idValidation")));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonCommentairesValidationStage") != null){
			Responsables.commentairesValidation(Integer.parseInt(request.getParameter("idValidation")), request.getParameter("commentairesValidation"));
			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonSupprimerExperience") != null){
			Eleves.supprimerExperience(Integer.parseInt(request.getParameter("idExperience")));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonSupprimerCompetence") != null){
			Eleves.supprimerCompetence(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), Integer.parseInt(request.getParameter("idCompetence")));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonSupprimerInteret") != null){
			Eleves.supprimerInteret(Integer.parseInt(request.getParameter("idInteret")));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonDeconnexion") != null){
			Utilisateurs.deconnecterUtilisateur(session);
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("envoyerValidation") != null){
			Eleves.envoyerValidation(request.getParameter("nomServiceAccueil"), request.getParameter("numSecu"), request.getParameter("optradio"), request.getParameter("adresse"), request.getParameter("email"), request.getParameter("portable"), request.getParameter("siret"), request.getParameter("ape"), request.getParameter("nomEntreprise"), request.getParameter("adresseEntreprise"), request.getParameter("adresseStage"), request.getParameter("telStage"), request.getParameter("nomRespo"), request.getParameter("prenomRespo"), request.getParameter("telRespo"), request.getParameter("mailRespo"), request.getParameter("fonctionRespo"), request.getParameter("prenomContactConvention"), request.getParameter("nomContactConvention"), request.getParameter("telConvention"), request.getParameter("adresseContactConvention"), request.getParameter("mailConvention"), request.getParameter("themeStage"), request.getParameter("dateDebutStage"), request.getParameter("dateFinStage"), request.getParameter("indemnite"), request.getParameter("avantage"), Integer.parseInt(request.getParameter("optradioIndemnites")), Integer.parseInt(request.getParameter("optradioEtranger")), request.getParameter("trouveStage"), request.getParameter("prezEntreprise"), request.getParameter("contexteStage"), request.getParameter("missionStage"), request.getParameter("etapeStage"), request.getParameter("connaissanceReq"), "en cours", ((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("prenomEleve"), request.getParameter("nomEleve"), Integer.parseInt(request.getParameter("parcoursEleve")));
			response.sendRedirect("accueil");
		}
		
		if (request.getParameter("boutonModifierValidation") != null){
			Eleves.modifierValidation(request.getParameter("nomServiceAccueil"), request.getParameter("numSecu"), request.getParameter("optradio"), request.getParameter("adresse"), request.getParameter("email"), request.getParameter("portable"), request.getParameter("siret"), request.getParameter("ape"), request.getParameter("nomEntreprise"), request.getParameter("adresseEntreprise"), request.getParameter("adresseStage"), request.getParameter("telStage"), request.getParameter("nomRespo"), request.getParameter("prenomRespo"), request.getParameter("telRespo"), request.getParameter("mailRespo"), request.getParameter("fonctionRespo"), request.getParameter("prenomContactConvention"), request.getParameter("nomContactConvention"), request.getParameter("telConvention"), request.getParameter("adresseContactConvention"), request.getParameter("mailConvention"), request.getParameter("themeStage"), request.getParameter("dateDebutStage"), request.getParameter("dateFinStage"), request.getParameter("indemnite"), request.getParameter("avantage"), Integer.parseInt(request.getParameter("optradioIndemnites")), Integer.parseInt(request.getParameter("optradioEtranger")), request.getParameter("trouveStage"), request.getParameter("prezEntreprise"), request.getParameter("contexteStage"), request.getParameter("missionStage"), request.getParameter("etapeStage"), request.getParameter("connaissanceReq"), "en cours", ((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("prenomEleve"), request.getParameter("nomEleve"), Integer.parseInt(request.getParameter("parcoursEleve")));
			response.sendRedirect("accueil");
		}
		
		
	}

}
