package com.themmt.model.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import java.sql.PreparedStatement;
import com.themmt.model.Review;

public class ReviewDAO {
	/**
	 * adds a Review to the database
	 * @param Review to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Review review ) throws SQLException {
		
		//INSERT INTO `tmi`.`review` 
		System.out.println("tried to add a review");
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
	
	public static Iterator get()
			throws IllegalArgumentException {
		String query = "SELECT * FROM review";
		ArrayList<Review> reviews = new ArrayList<Review>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Review u = new Review(rs.getString(Review.USERNAME_COLUMN),rs.getString(Review.TITLE_COLUMN),
						rs.getString(Review.REVIEW_COLUMN),rs.getBoolean(Review.ISFLAGGED_COLUMN), 
						rs.getString(Review.TITLECLASS_COLUMN));
				reviews.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return reviews.iterator();
	}
	
}