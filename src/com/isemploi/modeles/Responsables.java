package com.isemploi.modeles;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.isemploi.beans.Experience;
import com.isemploi.beans.Utilisateur;

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
	
}
