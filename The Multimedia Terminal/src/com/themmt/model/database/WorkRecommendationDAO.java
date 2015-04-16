package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.themmt.model.Recommendation;
import com.themmt.model.User;
import com.themmt.model.Work;
import com.themmt.model.WorkRecommendation;

public class WorkRecommendationDAO {
	
	
public static void add( WorkRecommendation recommendation) throws SQLException {
		
		
		String stmt = "INSERT INTO recommendation VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, recommendation.getUsername() );
			ps.setString(2, recommendation.getWorkFrom() );
			ps.setString(3, recommendation.getWorkTo() );
			ps.setInt(4, recommendation.getIsRec() );
			ps.setString(5, recommendation.getWorkFromClass() );
			ps.setString(6, recommendation.getWorkToClass() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static Iterator get()
			throws IllegalArgumentException {
		String query = "SELECT u.username, u.fname, u.lname, u.gender, u.email, u.password, u.profpic, u.description, u.isFlagged, a.username as adminName FROM user u LEFT JOIN admin a ON u.username = a.username;";
		ArrayList<User> users = new ArrayList<User>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				User u = new User(rs.getString(User.USERNAME_COLUMN),rs.getString(User.FNAME_COLUMN),
						rs.getString(User.LNAME_COLUMN),rs.getString(User.GENDER_COLUMN), 
						rs.getString(User.EMAIL_COLUMN),rs.getString(User.PASSWORD_COLUMN), 
						rs.getString(User.PROFPIC_COLUMN),rs.getString(User.DESCRIPTION_COLUMN),
						rs.getBoolean(User.FLAG_COLUMN));

				if(rs.getString(User.ADMIN_COLUMN)!=null){
					u.setAdmin(true);
				}

				users.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return users.iterator();
	}
	
	
	
	
}
