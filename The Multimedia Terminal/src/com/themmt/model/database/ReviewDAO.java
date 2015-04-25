package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.themmt.model.Review;

public class ReviewDAO {
	/**
	 * adds a Review to the database
	 * @param Review to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Review review ) throws SQLException {
		
		//INSERT INTO `tmi`.`review` 
		String stmt = "INSERT INTO review VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, review.getUsername() );
			ps.setString(2, review.getTitle() );
			ps.setString(3, review.getReview() );
			ps.setBoolean(4, review.getIsFlagged() );
			ps.setString(5, review.getTitleClass() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static void flag(String username, String title, String titleClass) throws SQLException
	{
		String query = "UPDATE review SET isFlagged = 1 WHERE review.username = ? AND review.title =? AND review.titleclass=?";
		try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ps.setString(1, username);
				ps.setString(2, title);
				ps.setString(3, titleClass);
			    ps.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				throw e;
			}
		
	
	}
	
	public static ArrayList<Review> get( String title, String classification )
			throws IllegalArgumentException {
		String query = "SELECT Re.title, Re.titleclass, Re.username, Re.review,  Re.isFlagged, IFNULL(AVG(Ra.Rating),0) Rating FROM review RE LEFT JOIN rating RA ON RE.title = RA.title AND RE.titleclass = RA.titleclass AND RE.username = RA.username WHERE RE.title = ? AND Re.titleclass = ? GROUP BY Re.title, Re.titleclass, RE.username";
		ArrayList<Review> reviews = new ArrayList<Review>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ps.setString( 1, title );
			ps.setString( 2, classification );
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Review u = new Review(rs.getString(Review.USERNAME_COLUMN),rs.getString(Review.TITLE_COLUMN),
						rs.getString(Review.REVIEW_COLUMN),rs.getBoolean(Review.ISFLAGGED_COLUMN), 
						rs.getString(Review.TITLECLASS_COLUMN), rs.getDouble(Review.RATING_COLUMN));
				reviews.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return reviews;
	}
	
}