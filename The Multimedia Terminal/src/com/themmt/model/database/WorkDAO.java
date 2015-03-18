package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.themmt.model.Work;

public class WorkDAO {
	
	public static final int PROPOSAL = 0;
	
	/**
	 * adds a work to the database
	 * @param work work to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Work work ) throws SQLException {
		String stmt = "INSERT INTO work VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, work.getTitle() );
			ps.setString(2, work.getReleaseYear() );
			ps.setString(3, work.getCover() );
			ps.setString(4, work.getClassification() );
			ps.setInt(5, work.getViewCount() );
			ps.setBoolean(6, work.isVerified() );
			ps.setString(7, work.getDescription() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public Iterator get(int criteria)
		throws IllegalArgumentException {
		String query = null;
		
		switch( criteria ) {
			case PROPOSAL:
				query = "SELECT * FROM `proposals`";
				break;
			default:
					throw new IllegalArgumentException();
		}
		
		ArrayList<Work> works = new ArrayList<Work>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Work w = new Work.WorkBuilder(rs.getString("title"),rs.getString("class"))
							.releaseYear(rs.getString("releaseYear")).cover(rs.getString("cover"))
							.description(rs.getString("description")).viewCount(rs.getInt("viewCount"))
							.isVerified(rs.getBoolean("isVerified")).build();
				works.add( w );
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return works.iterator();
	}
}
