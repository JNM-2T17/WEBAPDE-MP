package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.themmt.model.Work;

public class WorkDAO {
	
	public static final int PROPOSAL = 0;
	public static final int HOME = 1;
	public static final int ALL = 2;
	
	public static final int TYPE = 3;
	public static final int ALPHA = 4;
	public static final int DATE = 5;
	public static final int RATING = 6;
	
	
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
	
	public static ArrayList<Work> get(int criteria)
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
					Work w = new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
								.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
								.description(rs.getString(Work.DESC_COLUMN))
								.rating(criteria==PROPOSAL ? 0 : rs.getDouble(Work.RATING_COLUMN) )
								.viewCount(rs.getInt(Work.VIEW_COLUMN))
								.isVerified(rs.getBoolean(Work.VERIFY_COLUMN)).build();
					works.add( w );
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return works;
		}
		
	public static Work get( String title, String classification )
			throws IllegalArgumentException {
			String query = "SELECT * FROM `All Works` WHERE title = ? AND class = ?";
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ps.setString( 1, title );
				ps.setString( 2, classification );
				ResultSet rs = ps.executeQuery();
				
				if( rs.next() ) {
					return new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
								.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
								.description(rs.getString(Work.DESC_COLUMN))
								.rating(rs.getDouble(Work.RATING_COLUMN) )
								.viewCount(rs.getInt(Work.VIEW_COLUMN))
								.isVerified(rs.getBoolean(Work.VERIFY_COLUMN)).build();
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return null;
		}
		
		public static int getRatingCount( String title, String classification )
			throws IllegalArgumentException {
			String query = "SELECT COUNT(rating) ratings FROM rating WHERE title = ? AND titleclass = ?";
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ps.setString( 1, title );
				ps.setString( 2, classification );
				ResultSet rs = ps.executeQuery();
				
				if( rs.next() ) {
					return rs.getInt("ratings");
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return 0;
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
	
		public static ArrayList<Work> get(int criteria, int sort)
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
					Work w = new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
								.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
								.description(rs.getString(Work.DESC_COLUMN))
								.rating(criteria==PROPOSAL ? 0 : rs.getDouble(Work.RATING_COLUMN) )
								.viewCount(rs.getInt(Work.VIEW_COLUMN))
								.isVerified(rs.getBoolean(Work.VERIFY_COLUMN)).build();
					works.add( w );
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return works;
		}
		
		public static ArrayList<Work> search(String searchStr, int criteria, int sort)
				throws IllegalArgumentException {
				String query = "SELECT * FROM ";
				
				switch( criteria ) {
					case PROPOSAL:
						query += "`proposals`";
						break;
					case ALL:
						query += "`All Works`";
						break;
					default:
							throw new IllegalArgumentException("Invalid criteria");
				}
				
				query += " WHERE (title LIKE ? OR description LIKE ? OR \n`Created By`" + 
						 " LIKE ? OR releaseYear LIKE ?) AND isVerified = TRUE";
				
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
					case RATING:
						query += " ORDER BY rating DESC, class, title, releaseYear";
						break;
					default:
						throw new IllegalArgumentException("Invalid sort column");
				}
				
				ArrayList<Work> works = new ArrayList<Work>();
				
				try {
					PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
					ps.setString( 1, "%" + searchStr + "%" );
					ps.setString( 2, "%" + searchStr + "%" );
					ps.setString( 3, "%" + searchStr + "%" );
					ps.setString( 4, "%" + searchStr + "%" );
					
					ResultSet rs = ps.executeQuery();
					
					while( rs.next() ) {
						Work w = new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
									.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
									.description(rs.getString(Work.DESC_COLUMN))
									.rating(criteria==PROPOSAL ? 0 : rs.getDouble(Work.RATING_COLUMN) )
									.viewCount(rs.getInt(Work.VIEW_COLUMN))
									.isVerified(rs.getBoolean(Work.VERIFY_COLUMN)).build();
						works.add( w );
					}
				} catch(SQLException se) {
					se.printStackTrace();
				}
				
				return works;
			}
		
	public static void approveWork( String title, String classification ) {
		String pstmst = "UPDATE work SET isVerified = 1 WHERE title = ? AND class = ?";
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(pstmst);
			ps.setString(1, title );
			ps.setString(2, classification );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void incrementView( String title, String classification ) {
		String pstmst = "UPDATE work SET viewCount = viewCount + 1 WHERE title = ? AND class = ?";
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(pstmst);
			ps.setString(1, title );
			ps.setString(2, classification );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
