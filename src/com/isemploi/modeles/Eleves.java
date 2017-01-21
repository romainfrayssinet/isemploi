package com.isemploi.modeles;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.isemploi.beans.Competence;
import com.isemploi.beans.Experience;
import com.isemploi.beans.Interet;
import com.isemploi.beans.Utilisateur;

import static com.isemploi.dao.DAOUtilitaires.*;
import com.mysql.jdbc.Connection;

public class Eleves {

	public static List<Utilisateur> recupererEleves(){
		
		List<Utilisateur> eleves = new ArrayList<Utilisateur>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM utilisateur WHERE u_statut = ?", false, "eleve");
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				String login = resultat.getString("u_login");
				String prenom = resultat.getString("u_prenom");
				String nom = resultat.getString("u_nom");
				String photo = resultat.getString("u_photo");
				String numero = resultat.getString("u_numero");
				String debutNumero = resultat.getString("u_numero");
				
				Utilisateur utilisateur = new Utilisateur();
				utilisateur.setLogin(login);
				utilisateur.setPrenom(prenom);
				utilisateur.setNom(nom);
				utilisateur.setPhoto(photo);
				utilisateur.setNumero(numero);
				utilisateur.setDebutNumero(debutNumero.substring(0,2));
				eleves.add(utilisateur);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return eleves;
	}
	
	public static List<Experience> recupererExperiences(String login){
		
		List<Experience> experiences = new ArrayList<Experience>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM experience WHERE e_login = ?", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				int id = resultat.getInt("e_id");
				String type = resultat.getString("e_type");
				String entreprise = resultat.getString("e_entreprise");
				String duree = resultat.getString("e_duree");
				String poste = resultat.getString("e_poste");
				String description = resultat.getString("e_description");
				
				Experience experience = new Experience();
				experience.setId(id);
				experience.setLogin(login);
				experience.setType(type);
				experience.setEntreprise(entreprise);
				experience.setDuree(duree);
				experience.setPoste(poste);
				experience.setDescription(description);
				experiences.add(experience);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return experiences;
	}
	
	public static List<Interet> recupererInterets(String login){
		
		List<Interet> interets = new ArrayList<Interet>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM interet WHERE i_login = ?", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				Interet interet = new Interet();
				interet.setId(resultat.getInt("i_id"));
				interet.setNom(resultat.getString("i_nom"));
				interets.add(interet);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return interets;
	}
	
	public static void modifierInfosEleve(String login, String situation, String parcours, String lieu, String recherche, String promotion, String portable, String linkedin){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "UPDATE utilisateur SET u_situation = ?, u_parcours = ?, u_lieu = ?, u_recherche = ?, u_promo = ?, u_portable = ?, u_linkedin = ? WHERE u_login = ?", false, situation, parcours, lieu, recherche, promotion, portable, linkedin, login);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void ajouterExperienceEleve(String login, String type, String entreprise, String poste, String duree, String description){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "INSERT INTO experience (e_login, e_entreprise, e_poste, e_duree, e_description, e_type) VALUES(?, ?, ?, ?, ?, ?)", false, login, entreprise, poste, duree, description, type);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void supprimerExperience(int idExperience){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "DELETE FROM experience WHERE e_id = ?", false, idExperience);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void supprimerCompetence(String login, int idCompetence){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "DELETE FROM competence_utilisateur WHERE u_login = ? AND c_id = ?", false, login, idCompetence);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void supprimerInteret(int idInteret){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "DELETE FROM interet WHERE i_id = ?", false, idInteret);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void ajouterInteretEleve(String login, String nom){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "INSERT INTO interet (i_login, i_nom) VALUES(?, ?)", false, login, nom);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void ajouterCompetenceEleve(int id, String login){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "INSERT INTO competence_utilisateur (c_id, u_login) VALUES(?, ?)", false, id, login);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void ajouterCompetenceBDD(String nom){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "INSERT INTO competence (c_nom) VALUES(?)", false, nom);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static int recupererIdCompetenceByName(String nom){
		Connection connexion = null;
		PreparedStatement requete = null;
		ResultSet resultat = null;
		int id = 0;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT c_id FROM competence WHERE c_nom = ?", false, nom);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				id = resultat.getInt("c_id");
				
			}
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
		return id;
	}
	
	public static List<Competence> recupererCompetences(String login){
		
		List<Competence> competences = new ArrayList<Competence>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM competence WHERE c_id NOT IN (SELECT c_id FROM competence_utilisateur WHERE u_login = ?) ORDER BY c_nom", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				int idCompetence = resultat.getInt("c_id");
				String nom = resultat.getString("c_nom");
				
				Competence competence = new Competence();
				competence.setId(idCompetence);
				competence.setNom(nom);
				competences.add(competence);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return competences;
	}
	
	public static List<Competence> recupererCompetencesEleve(String login){
		
		List<Competence> competences = new ArrayList<Competence>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM competence WHERE c_id IN (SELECT c_id FROM competence_utilisateur WHERE u_login = ?)", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				int idCompetence = resultat.getInt("c_id");
				String nom = resultat.getString("c_nom");
				
				Competence competence = new Competence();
				competence.setId(idCompetence);
				competence.setNom(nom);
				competences.add(competence);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return competences;
	}
	
}
