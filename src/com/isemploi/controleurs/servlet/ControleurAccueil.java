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
				request.setAttribute("competences", Eleves.recupererCompetences(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("experiences", Eleves.recupererExperiences(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("interetsEleve", Eleves.recupererInterets(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				request.setAttribute("competencesEleve", Eleves.recupererCompetencesEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin()));
				this.getServletContext().getRequestDispatcher( "/jsp/eleve.jsp" ).forward(request, response);
			} else{
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
			Eleves.modifierInfosEleve(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("newStatut"), request.getParameter("newParcours"), request.getParameter("newLieu"), request.getParameter("newRecherche"), request.getParameter("newPromo"), request.getParameter("newPhone"), request.getParameter("newLinkedin"));
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
			Responsables.modifierInfosRespos(((Utilisateur) session.getAttribute("sessionUtilisateur")).getLogin(), request.getParameter("newProfession"), request.getParameter("newLieu"), request.getParameter("newRole"));
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
		
		
	}

}
