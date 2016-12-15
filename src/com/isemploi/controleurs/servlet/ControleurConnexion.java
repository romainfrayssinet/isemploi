package com.isemploi.controleurs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.isemploi.beans.Utilisateur;

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
		 
		 Utilisateur user = new Utilisateur();
		 
		 user.setLogin(login);
		 user.setMdp(mdp);
		 
		 
		 
	}

}
