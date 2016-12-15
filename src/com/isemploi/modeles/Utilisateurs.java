package com.isemploi.modeles;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.isemploi.beans.Eleve;
import com.isemploi.beans.LDAPObject;
import com.isemploi.beans.Utilisateur;

import static com.isemploi.dao.DAOUtilitaires.*;
import com.mysql.jdbc.Connection;


public class Utilisateurs{
	
	public static List<Eleve> recupererEleves(){
		
		List<Eleve> eleves = new ArrayList<Eleve>();
		Connection connexion = null;
		ResultSet resultatListeEleves = null;
		PreparedStatement requete = null;
		
		try{
			connexion = connexionBDD();
			requete = initialiserRequete(connexion, "SELECT * FROM utilisateur", false);
			resultatListeEleves = requete.executeQuery();
			
			while(resultatListeEleves.next()){
				
				int id = resultatListeEleves.getInt("u_id");
				String prenom = resultatListeEleves.getString("u_prenom");
				String nom = resultatListeEleves.getString("u_nom");
				
				Eleve eleve = new Eleve();
				eleve.setId(id);
				eleve.setPrenom(prenom);
				eleve.setNom(nom);
				
				eleves.add(eleve);
				
			}
		} catch(SQLException e){
		} finally{
			fermetureResultSet(resultatListeEleves);
			fermetureStatement(requete);
			fermetureConnexion(connexion);
		}
		
		
		return eleves;
	}
	
	public static boolean connecterUtilisateur(Utilisateur utilisateur){
		
		boolean success = false;
		
		return success;
	}
	
	public static void main(String[] args){
		
		LDAPaccess access = new LDAPaccess();
		try {
		LDAPObject test = access.LDAPget("rfrayssi", "i49705-NM"); // remplacez login par la variable qui contient le login, et mdp par la variable qui contient le mot de passe
		if (test == null){
			System.out.println("login invalide");
			System.exit(1);
		}
		System.out.println(test.toString());
		System.exit(0);
		} catch(Exception e) {
			System.err.println(e.getMessage());
			System.exit(1);
		}
	}
}

