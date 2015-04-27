package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.themmt.model.User;
import com.themmt.model.WorkRecommendation;

public class WorkRecommendationDAO {
	
	
public static void add( WorkRecommendation recommendation, boolean add) throws SQLException {
		
		
		String stmt = add ? "INSERT INTO recommendation VALUES (?,?,?,?,?,?)" : 
							"DELETE FROM recommendation WHERE username = ? AND" + 
							" workFrom = ? AND workTo = ? AND isRec = ? AND " + 
							"workFromClass = ? AND workToClass = ?";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, recommendation.getUsername() );
			ps.setString(2, recommendation.getWorkFrom() );
			ps.setString(3, recommendation.getWorkTo() );
			ps.setInt(4, recommendation.getIsRec() );
			ps.setString(5, recommendation.getWorkFromClass() );
			ps.setString(6, recommendation.getWorkToClass() );
			ps.execute();
			
			ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, recommendation.getUsername() );
			ps.setString(2, recommendation.getWorkTo() );
			ps.setString(3, recommendation.getWorkFrom() );
			ps.setInt(4, recommendation.getIsRec() );
			ps.setString(5, recommendation.getWorkToClass() );
			ps.setString(6, recommendation.getWorkFromClass() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static Iterator<User> get()
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

	public static ArrayList<WorkRecommendation> get( String title, String classif, String username, int isRec )
			throws IllegalArgumentException {
		String query = "SELECT * FROM recommendation WHERE workFrom = ? AND workFromClass = ? AND username = ? AND isRec = ?";
		ArrayList<WorkRecommendation> recs = new ArrayList<WorkRecommendation>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ps.setString( 1, title );
			ps.setString( 2, classif );
			ps.setString( 3, username );
			ps.setInt( 4, isRec );
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				WorkRecommendation wr = new WorkRecommendation(username, rs.getString( WorkRecommendation.WORKFROM_COLUMN),
																rs.getString(WorkRecommendation.WORKTO_COLUMN),
																rs.getInt(WorkRecommendation.ISREC_COLUMN),
																rs.getString(WorkRecommendation.WORKFROMCLASS_COLUMN),
																rs.getString(WorkRecommendation.WORKTOCLASS_COLUMN));
				recs.add(wr);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return recs;
	}


	
	
}
