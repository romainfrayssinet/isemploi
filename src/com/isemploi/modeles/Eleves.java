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
import com.isemploi.beans.Validation;

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
	
	public static void modifierInfosEleve(String login, String situation, int parcours, String lieu, String recherche, String promotion, String portable, String linkedin){
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "UPDATE utilisateur SET u_situation = ?, p_id = ?, u_lieu = ?, u_recherche = ?, u_promo = ?, u_portable = ?, u_linkedin = ? WHERE u_login = ?", false, situation, parcours, lieu, recherche, promotion, portable, linkedin, login);
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
	
	public static void envoyerValidation(String nomAccueil, String secu, String annee, String adresseEleve, String mail, String portableEleve, String siretEntreprise, String ape, String nomEntreprise, String adresse1Entreprise, String adresse2Entreprise, String numeroAccueil, String nomTuteur, String prenomTuteur, String telephoneTuteur, String mailTuteur, String posteTuteur, String prenomRH, String nomRH, String telephoneRH, String adresseRH, String mailRH, String themeStage, String debutStage, String finStage, String salaire, String avantages, int indemnites, int etranger, String moyenStage, String presentationEntreprise, String contexteStage, String missions, String etapes, String connaissances, String valide, String login, String prenom, String nom, int parcours){
		
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "INSERT INTO validation (v_nom_accueil, v_annee, v_prenom_eleve, v_nom_eleve, p_id, v_secu, v_adresse_eleve, v_email, v_portable_eleve, v_siret_entreprise, v_ape, v_nom_entreprise, v_adresse1_entreprise, v_adresse2_entreprise, v_service_accueil, v_tuteur_nom, v_tuteur_prenom, v_tuteur_tel, v_tuteur_mail, v_tuteur_poste, v_rh_prenom, v_rh_nom, v_rh_tel, v_rh_adresse, v_rh_mail, v_theme_stage, v_debut_stage, v_fin_stage, v_salaire, v_avantage, v_indemnite_etranger, v_deplacement_etranger, v_moyen_stage, v_presentation_entreprise, v_contexte_stage, v_mission, v_etapes, v_connaissances, v_valide, u_login) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", false, nomAccueil, annee, prenom, nom, parcours, secu, adresseEleve, mail, portableEleve, siretEntreprise, ape, nomEntreprise, adresse1Entreprise, adresse2Entreprise, numeroAccueil, nomTuteur, prenomTuteur, telephoneTuteur, mailTuteur, posteTuteur, prenomRH, nomRH, telephoneRH, adresseRH, mailRH, themeStage, debutStage, finStage, salaire, avantages, indemnites, etranger, moyenStage, presentationEntreprise, contexteStage, missions, etapes, connaissances, valide, login);
			requete.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
	}
	
	public static void modifierValidation(String nomAccueil, String secu, String annee, String adresseEleve, String mail, String portableEleve, String siretEntreprise, String ape, String nomEntreprise, String adresse1Entreprise, String adresse2Entreprise, String numeroAccueil, String nomTuteur, String prenomTuteur, String telephoneTuteur, String mailTuteur, String posteTuteur, String prenomRH, String nomRH, String telephoneRH, String adresseRH, String mailRH, String themeStage, String debutStage, String finStage, String salaire, String avantages, int indemnites, int etranger, String moyenStage, String presentationEntreprise, String contexteStage, String missions, String etapes, String connaissances, String valide, String login, String prenom, String nom, int parcours){
		
		Connection connexion = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "UPDATE validation SET v_nom_accueil = ?, v_annee = ?, v_prenom_eleve = ?, v_nom_eleve = ?, p_id = ?, v_secu = ?, v_adresse_eleve = ?, v_email = ?, v_portable_eleve = ?, v_siret_entreprise = ?, v_ape = ?, v_nom_entreprise = ?, v_adresse1_entreprise = ?, v_adresse2_entreprise = ?, v_service_accueil = ?, v_tuteur_nom = ?, v_tuteur_prenom = ?, v_tuteur_tel = ?, v_tuteur_mail = ?, v_tuteur_poste = ?, v_rh_prenom = ?, v_rh_nom = ?, v_rh_tel = ?, v_rh_adresse = ?, v_rh_mail = ?, v_theme_stage = ?, v_debut_stage = ?, v_fin_stage = ?, v_salaire = ?, v_avantage = ?, v_indemnite_etranger = ?, v_deplacement_etranger = ?, v_moyen_stage = ? , v_presentation_entreprise = ?, v_contexte_stage = ?, v_mission = ?, v_etapes = ?, v_connaissances = ?, v_valide = ? WHERE u_login = ?", false, nomAccueil, annee, prenom, nom, parcours, secu, adresseEleve, mail, portableEleve, siretEntreprise, ape, nomEntreprise, adresse1Entreprise, adresse2Entreprise, numeroAccueil, nomTuteur, prenomTuteur, telephoneTuteur, mailTuteur, posteTuteur, prenomRH, nomRH, telephoneRH, adresseRH, mailRH, themeStage, debutStage, finStage, salaire, avantages, indemnites, etranger, moyenStage, presentationEntreprise, contexteStage, missions, etapes, connaissances, valide, login);
			requete.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
	}
	
	public static int recupererEtatValidation(String login){
		Connection connexion = null;
		PreparedStatement requete = null;
		ResultSet resultat = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT v_valide FROM validation WHERE u_login = ?", false, login);
			resultat = requete.executeQuery();
			
			if (resultat.next() == false){
				return 0;
			} else{
				String etat = resultat.getString("v_valide");
				if (etat.equals("en cours")){
					return 1;
				}
				if (etat.equals("demande commentaires")){
					return 3;
				}
				if (etat.equals("valide")){
					return 2;
				} else{
					return 0;
				}
			}
			
		} catch(SQLException e){
			return 0;
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
	}
	
public static Validation recupererValidationEleve(String login){
		
		Connection connexion = null;
		ResultSet resultat = null;
		PreparedStatement requete = null;
		Validation validation = new Validation();
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM validation WHERE u_login = ?", false, login);
			resultat = requete.executeQuery();
			
			while(resultat.next()){
				
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
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultat);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
	
		return validation;
	}
	
}
