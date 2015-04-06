package com.themmt.model.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import java.sql.PreparedStatement;
import com.themmt.model.Rating;

public class RatingDAO {
	/**
	 * adds a Rating to the database
	 * @param Rating to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Rating rating ) throws SQLException {
		
		//INSERT INTO `tmi`.`rating` 
		String stmt = "INSERT INTO rating VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, rating.getUsername() );
			ps.setString(2, rating.getTitle() );
			ps.setDouble(3, rating.getRating() );
			ps.setString(4, rating.getTitleClass() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static Iterator get()
			throws IllegalArgumentException {
		String query = "SELECT * FROM rating";
		ArrayList<Rating> ratings = new ArrayList<Rating>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Rating u = new Rating(rs.getString(Rating.USERNAME_COLUMN),rs.getString(Rating.TITLE_COLUMN),
						rs.getInt(Rating.RATING_COLUMN), rs.getString(Rating.TITLECLASS_COLUMN));
				ratings.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return ratings.iterator();
	}
	
}
	
