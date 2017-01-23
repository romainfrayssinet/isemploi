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
 * Servlet implementation class ControleurProfil
 */
@WebServlet(name="Profil", urlPatterns="/profil")
public class ControleurProfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleurProfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (((Utilisateur) session.getAttribute("sessionUtilisateur")).getStatut().equals("eleve")){
			this.getServletContext().getRequestDispatcher( "/jsp/error.jsp" ).forward(request, response);
		} else{
			request.setAttribute("user", Utilisateurs.recupererUtilisateur(request.getParameter("login")));
			request.setAttribute("experiences", Eleves.recupererExperiences(request.getParameter("login")));
			request.setAttribute("interetsEleve", Eleves.recupererInterets(request.getParameter("login")));
			request.setAttribute("competencesEleve", Eleves.recupererCompetencesEleve(request.getParameter("login")));
			this.getServletContext().getRequestDispatcher( "/jsp/profil.jsp" ).forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (request.getParameter("boutonDeconnexion") != null){
			Utilisateurs.deconnecterUtilisateur(session);
			response.sendRedirect("accueil");
		}
	}

}
