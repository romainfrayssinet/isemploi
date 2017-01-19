package com.isemploi.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.mysql.jdbc.Statement;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class DAOUtilitaires {
		
	public static Connection connexionBDD(){
		Connection connexion = null;
		
		 String url = "jdbc:mysql://localhost:3306/isemploi"; //for SQL and oracle or any other db server this url differs. where ravi is the database name and 3306 is the port where mysql is running
		 String username = "root"; //username of database user
		 String password = "root"; //password
		 
		 try{
			 try{
				 Class.forName("com.mysql.jdbc.Driver");// differs from DB server to server
				 connexion = (Connection) DriverManager.getConnection(url, username, password);
			 }
			 catch (ClassNotFoundException e){
				 e.printStackTrace();
			 }

		 }
		 catch (Exception e)
		 {
			 e.printStackTrace();
		 }

		 return connexion;
	}
	
	public static PreparedStatement initialiserRequete(Connection connexion, String sql, boolean returnGeneratedKeys, Object... objets) throws SQLException {
	    PreparedStatement preparedStatement = connexion.prepareStatement(sql, returnGeneratedKeys ? Statement.RETURN_GENERATED_KEYS : Statement.NO_GENERATED_KEYS);
	    for (int i = 0; i < objets.length; i++) {
	        preparedStatement.setObject(i + 1, objets[i]);
	    }
	    return preparedStatement;
	}
	
	public static void fermetureResultSet(ResultSet resultSet) {
	    if (resultSet != null) {
	        try {
	            resultSet.close();
	        } catch (SQLException e) {
	            System.out.println("Échec de la fermeture du ResultSet : " + e.getMessage());
	        }
	    }
	}
	
	public static void fermetureStatement(PreparedStatement statement) {
	    if (statement != null) {
	        try {
	            statement.close();
	        } catch (SQLException e) {
	            System.out.println("Échec de la fermeture du Statement : " + e.getMessage());
	        }
	    }
	}
	
	public static void fermetureConnexion(Connection connexion) {
	    if (connexion != null) {
	        try {
	            connexion.close();
	        } catch (SQLException e) {
	            System.out.println("Échec de la fermeture de la connexion : " + e.getMessage());
	        }
	    }
	}
	
	public static String capitalize(String str){
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
	
	
	
	

}
