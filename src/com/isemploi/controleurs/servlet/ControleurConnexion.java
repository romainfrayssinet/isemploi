package com.isemploi.controleurs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.isemploi.dao.DAOUtilitaires;
import com.isemploi.modeles.Utilisateurs;

/**
 * Servlet implementation class controleurConnexion
 */
@WebServlet(name="Connexion", urlPatterns="/connexion")
public class ControleurConnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleurConnexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher( "/jsp/connexion.jsp" ).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("identifiant");
		String mdp = request.getParameter("mdp");
		
		if(Utilisateurs.connecterLDAP(login, mdp) == true){
			if(Utilisateurs.verifierUtilisateurInscrit(login) == true){
				HttpSession session = request.getSession();
				session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(login));
				response.sendRedirect("accueil");
			} else{
				String prenom = DAOUtilitaires.capitalize(Utilisateurs.recupererInfosLDAP(login, mdp).getPrenom());
				String nom = DAOUtilitaires.capitalize(Utilisateurs.recupererInfosLDAP(login, mdp).getNomFamille());
				String statut = Utilisateurs.recupererInfosLDAP(login, mdp).getType();
				int numero = Integer.parseInt(Utilisateurs.recupererInfosLDAP(login, mdp).getNumber());
				String email = Utilisateurs.recupererInfosLDAP(login, mdp).getMail();
				Utilisateurs.inscrireUtilisateur(login, prenom, nom, statut, numero, email);
				
				HttpSession session = request.getSession();
				session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(login));
				
				response.sendRedirect("accueil");
			}
		} else{
			request.setAttribute("message", "Le login ou le mot de passe est incorrect !");
			this.getServletContext().getRequestDispatcher( "/jsp/connexion.jsp" ).forward(request, response);
		}
		
//		if (mdp.equals(Utilisateurs.connecterUtilisateur(login))){
//			HttpSession session = request.getSession();
//			session.setAttribute("sessionUtilisateur", Utilisateurs.recupererUtilisateur(login));
//			response.sendRedirect("accueil");
//			
//		} else{
//			request.setAttribute("message", "Le login ou le mot de passe est incorrect !");
//			this.getServletContext().getRequestDispatcher( "/jsp/connexion.jsp" ).forward(request, response);
//		}
		
	}

}
