package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.themmt.model.Work;

public class WorkDAO {
	
	public static final int PROPOSAL = 0;
	public static final int HOME = 1;
	
	public static final int TYPE = 2;
	public static final int ALPHA = 3;
	public static final int DATE = 4;
	
	
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
	
	public static Iterator get(int criteria)
		throws IllegalArgumentException {
		String query = "SELECT * FROM ";
		
		switch( criteria ) {
			case PROPOSAL:
				query += "`proposals`";
				break;
			case HOME:
				query += "`Home Page`";
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
							.description(rs.getString("description"))
							.rating(criteria==PROPOSAL ? 0 : rs.getDouble("rating") )
							.viewCount(rs.getInt("viewCount"))
							.isVerified(rs.getBoolean("isVerified")).build();
				works.add( w );
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return works.iterator();
	}
	
	public static int getCount(int criteria)
			throws IllegalArgumentException {
			String query = null;
			
			switch( criteria ) {
				case PROPOSAL:
					query = "SELECT COUNT(*) FROM `proposals`";
					break;
				default:
						throw new IllegalArgumentException();
			}
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				
				rs.next();
				return rs.getInt("COUNT(*)");
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return 0;
		}
	
		public static Iterator get(int criteria, int sort)
			throws IllegalArgumentException {
			String query = null;
			
			switch( criteria ) {
				case PROPOSAL:
					query = "SELECT * FROM `proposals`";
					break;
				default:
						throw new IllegalArgumentException("Invalid criteria");
			}
			
			switch( sort ) {
				case TYPE:
					query += " ORDER BY class, title, releaseYear";
					break;
				case ALPHA:
					query += " ORDER BY title, class, releaseYear";
					break;
				case DATE:
					query += " ORDER BY releaseYear, class, title";
					break;
				default:
					throw new IllegalArgumentException("Invalid sort column");
			}
			
			ArrayList<Work> works = new ArrayList<Work>();
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				
				while( rs.next() ) {
					Work w = new Work.WorkBuilder(rs.getString("title"),rs.getString("class"))
								.releaseYear(rs.getString("releaseYear")).cover(rs.getString("cover"))
								.description(rs.getString("description"))
								.rating(criteria==PROPOSAL ? 0 : rs.getDouble("rating") )
								.viewCount(rs.getInt("viewCount"))
								.isVerified(rs.getBoolean("isVerified")).build();
					works.add( w );
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return works.iterator();
		}
}
