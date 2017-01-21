package com.isemploi.modeles;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.isemploi.beans.Experience;
import com.isemploi.beans.LDAPObject;
import com.isemploi.beans.Parcours;
import com.isemploi.beans.Utilisateur;

import static com.isemploi.dao.DAOUtilitaires.*;
import com.mysql.jdbc.Connection;


public class Utilisateurs{
	
	public static boolean connecterLDAP(String login, String mdp){
		LDAPaccess access = new LDAPaccess();
		
		try{
			LDAPObject test = access.LDAPget(login, mdp); // remplacez login par la variable qui contient le login, et mdp par la variable qui contient le mot de passe
			if (test == null){
				return false;
			} else{
				return true;
			}
		} catch(Exception e){
			return false;
		}
		
	}
	
	public static boolean verifierUtilisateurInscrit(String login){
		Connection connexion = null;
		PreparedStatement requete = null;
		ResultSet ResultatConnexion = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT u_mdp FROM utilisateur WHERE u_login = ?", false, login);
			ResultatConnexion = requete.executeQuery();
			
			if (ResultatConnexion.next() == false){
				return false;
			} else{
				return true;
			}
			
		} catch(SQLException e){
			return false;
		} finally{
			fermetureResultSet(ResultatConnexion);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
	}
	
	public static LDAPObject recupererInfosLDAP(String login, String mdp) {
		
		LDAPaccess access = new LDAPaccess();
		LDAPObject test = null;
		try {
			test = access.LDAPget(login, mdp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return test;
		
	}
	
	public static void inscrireUtilisateur (String login, String prenom, String nom, String statut, int numero, String email){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "INSERT INTO utilisateur (u_login, u_prenom, u_nom, u_statut, u_email, u_numero) VALUES(?, ?, ?, ?, ?, ?)", false, login, prenom, nom, statut, email, numero);
			requete.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static Utilisateur recupererUtilisateur(String login){
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		Utilisateur utilisateur = new Utilisateur();
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM utilisateur WHERE u_login = ?", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				utilisateur.setId(resultat.getInt("u_id"));
				utilisateur.setLogin(login);
				utilisateur.setPrenom(resultat.getString("u_prenom"));
				utilisateur.setNom(resultat.getString("u_nom"));
				utilisateur.setStatut(resultat.getString("u_statut"));
				utilisateur.setEmail(resultat.getString("u_email"));
				utilisateur.setPhoto(resultat.getString("u_photo"));
				utilisateur.setMdp(resultat.getString("u_mdp"));
				utilisateur.setPromo(resultat.getString("u_promo"));
				utilisateur.setCv(resultat.getString("u_cv"));
				utilisateur.setPortable(resultat.getString("u_portable"));
				utilisateur.setLinkedin(resultat.getString("u_linkedin"));
				utilisateur.setLieuTravail(resultat.getString("u_lieu"));
				utilisateur.setRecherche(resultat.getString("u_recherche"));
				utilisateur.setSituation(resultat.getString("u_situation"));
				utilisateur.setNumero(resultat.getString("u_numero"));
				utilisateur.setProfession(resultat.getString("u_profession"));
				utilisateur.setDebutNumero(resultat.getString("u_numero").substring(0,2));
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM parcours WHERE p_id IN (SELECT p_id FROM utilisateur WHERE u_login = ?)", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				utilisateur.setParcours(resultat.getString("p_nom"));
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
		return utilisateur;
	}
	
	public static String connecterUtilisateur(String login){
	
		Connection connexion = null;
		PreparedStatement requete = null;
		ResultSet ResultatConnexion = null;
		String mdp = null;
		
		try{
			connexion = connexionBDD();
			
			requete = initialiserRequete(connexion, "SELECT u_mdp FROM utilisateur WHERE u_login = ?", false, login);
			ResultatConnexion = requete.executeQuery();
			
			while(ResultatConnexion.next()){
			
				mdp = ResultatConnexion.getString("u_mdp");
	
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(ResultatConnexion);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
		return mdp;
	
	}
	
	public static void deconnecterUtilisateur(HttpSession session){
        session.invalidate();
	}
	
	public static List<Parcours> recupererParcours(){
		
		List<Parcours> lesParcours = new ArrayList<Parcours>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM parcours", false);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				int id = resultat.getInt("p_id");
				String nom = resultat.getString("p_nom");
				
				Parcours parcours = new Parcours();
				parcours.setId(id);
				parcours.setNom(nom);
				lesParcours.add(parcours);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return lesParcours;
	}

}

