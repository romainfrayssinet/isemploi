package com.isemploi.modeles;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.isemploi.beans.Competence;
import com.isemploi.beans.Experience;
import com.isemploi.beans.Utilisateur;
import com.isemploi.beans.Validation;

import static com.isemploi.dao.DAOUtilitaires.*;
import com.mysql.jdbc.Connection;

public class Responsables {

	public static void modifierInfosRespos(String login, String profession, String lieu, int parcours){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "UPDATE utilisateur SET u_profession = ?, u_lieu = ?, p_id = ? WHERE u_login = ?", false, profession, lieu, parcours, login);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static List<Validation> recupererValidations(String login){
		
		List<Validation> validations = new ArrayList<Validation>();
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM validation WHERE p_id IN (SELECT p_id FROM utilisateur WHERE u_login = ?) AND v_valide != ?", false, login, "demande commentaires");
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
				Validation validation = new Validation();
				
				validation.setId(resultat.getInt("v_id"));
				validation.setPrenomEleve(resultat.getString("v_prenom_eleve"));
				validation.setNomEleve(resultat.getString("v_nom_eleve"));
				validation.setAnnee(resultat.getString("v_annee"));
				validation.setSecu(resultat.getString("v_secu"));
				validation.setEmail_eleve(resultat.getString("v_email"));
				validation.setTel_eleve(resultat.getString("v_portable_eleve"));
				validation.setSiret(resultat.getString("v_ape"));
				validation.setNom_ent(resultat.getString("v_nom_entreprise"));
				validation.setAdresse1_ent(resultat.getString("v_adresse1_entreprise"));
				validation.setAdresse2_ent(resultat.getString("v_adresse2_entreprise"));
				validation.setService_accueil(resultat.getString("v_service_accueil"));
				validation.setTuteur_prenom(resultat.getString("v_tuteur_prenom"));
				validation.setTuteur_nom(resultat.getString("v_tuteur_nom"));
				validation.setTuteur_mail(resultat.getString("v_tuteur_mail"));
				validation.setTuteur_poste(resultat.getString("v_tuteur_poste"));
				validation.setTuteur_tel(resultat.getString("v_tuteur_tel"));
				validation.setRh_prenom(resultat.getString("v_rh_prenom"));
				validation.setRh_nom(resultat.getString("v_rh_nom"));
				validation.setRh_tel(resultat.getString("v_rh_tel"));
				validation.setRh_adresse(resultat.getString("v_rh_adresse"));
				validation.setRh_mail(resultat.getString("v_rh_mail"));
				validation.setTheme_stage(resultat.getString("v_theme_stage"));
				validation.setDebut_stage(resultat.getString("v_debut_stage"));
				validation.setFin_stage(resultat.getString("v_fin_stage"));
				validation.setSalaire(resultat.getString("v_salaire"));
				validation.setAvantage(resultat.getString("v_avantage"));
				validation.setIndemnite_etranger(resultat.getInt("v_indemnite_etranger"));
				validation.setDeplacement_etranger(resultat.getInt("v_deplacement_etranger"));
				validation.setMoyen_stage(resultat.getString("v_moyen_stage"));
				validation.setPresentation_ent(resultat.getString("v_presentation_entreprise"));
				validation.setContexte_stage(resultat.getString("v_contexte_stage"));
				validation.setMission(resultat.getString("v_mission"));
				validation.setEtapes(resultat.getString("v_etapes"));
				validation.setConnaissances(resultat.getString("v_connaissances"));
				validation.setEtat(resultat.getString("v_valide"));
				validation.setNomAccueil(resultat.getString("v_nom_accueil"));
				validation.setCommentaires(resultat.getString("v_commentaires"));
				
				validations.add(validation);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return validations;
	}
	
	public static void accepterValidation(int idValidation){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "UPDATE validation SET v_valide = ? WHERE v_id = ?", false, "valide", idValidation);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void commentairesValidation(int idValidation, String commentaires){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "UPDATE validation SET v_valide = ?, v_commentaires = ? WHERE v_id = ?", false, "demande commentaires", commentaires, idValidation);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
	public static void refuserValidation(int idValidation){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "DELETE FROM validation WHERE v_id = ?", false, idValidation);
			requete.executeUpdate();
			
		} catch(SQLException e){
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	}
	
}
