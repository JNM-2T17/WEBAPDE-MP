package com.themmt.model.database;

import java.sql.Connection;
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
		Connection c = DBConnection.getConnection();
		try {
			PreparedStatement ps = c.prepareStatement(stmt);
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
			Connection c = DBConnection.getConnection();
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
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
			Connection c = DBConnection.getConnection();
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
				ps.setString( 1, title );
				ps.setString( 2, classification );
				ResultSet rs = ps.executeQuery();
				
				if( rs.next() ) {
					Work w = new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
								.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
								.description(rs.getString(Work.DESC_COLUMN))
								.rating(rs.getDouble(Work.RATING_COLUMN) )
								.viewCount(rs.getInt(Work.VIEW_COLUMN))
								.isVerified(rs.getBoolean(Work.VERIFY_COLUMN)).build();
					query = "SELECT * FROM genre WHERE work = ? AND workClass = ? AND isVerified = 1";
					ps = c.prepareStatement(query);
					ps.setString(1, w.getTitle() );
					ps.setString(2, w.getClassification() );
					ResultSet rs2 = ps.executeQuery();
					while( rs2.next() ) {
						w.addGenre( rs2.getString("genre") );
					}
					query = "SELECT * FROM keyword WHERE work = ? AND workClass = ? AND isVerified = 1";
					ps = c.prepareStatement(query);
					ps.setString(1, w.getTitle() );
					ps.setString(2, w.getClassification() );
					rs2 = ps.executeQuery();
					while( rs2.next() ) {
						w.addKeyword( rs2.getString("keyword") );
					}
					return w;
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return null;
		}
		
		public static int getRatingCount( String title, String classification )
			throws IllegalArgumentException {
			String query = "SELECT COUNT(rating) ratings FROM rating WHERE title = ? AND titleclass = ?";
			Connection c = DBConnection.getConnection();
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
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
			Connection c = DBConnection.getConnection();
			
			switch( criteria ) {
				case PROPOSAL:
					query = "SELECT COUNT(*) FROM `proposals`";
					break;
				default:
						throw new IllegalArgumentException();
			}
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
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
			String query = "SELECT * FROM ";
			Connection c = DBConnection.getConnection();
			
			switch( criteria ) {
				case PROPOSAL:
					query += "`proposals`";
					break;
				case ALL:
					query += "`All Works`";
					break;
				case HOME:
					query += "`Home Page`";
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
				case RATING:
					query += " ORDER BY rating DESC, class, title, releaseYear";
					break;
				default:
					throw new IllegalArgumentException("Invalid sort column");
			}
			
			ArrayList<Work> works = new ArrayList<Work>();
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
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
		
		public static ArrayList<Work> getFavorites( String username ) {
			String query = "SELECT * FROM `All Works` AW, favorites F WHERE F.title = AW.title AND F.titleclass = AW.class AND username = ?";
			Connection c = DBConnection.getConnection();
			ArrayList<Work> works = new ArrayList<Work>();
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				
				while( rs.next() ) {
					Work w = new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
								.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
								.description(rs.getString(Work.DESC_COLUMN))
								.rating(rs.getDouble(Work.RATING_COLUMN))
								.viewCount(rs.getInt(Work.VIEW_COLUMN))
								.isVerified(rs.getBoolean(Work.VERIFY_COLUMN)).build();
					works.add( w );
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return works;
		}
		
		public static ArrayList<Work> getTasteRecommendations( String username ) {
			String query = "SELECT workTo `Title`, workToClass `Class`, COUNT(*) `Recommendations`, releaseYear, cover, description, rating, viewCount " +  
						   "FROM recommendation R, favorites F, `All Works` AW " + 
						   "WHERE R.workFrom = F.title AND R.workFromClass = F.titleclass AND AW.title = R.workTo AND AW.class = R.workToClass AND F.username = ? AND isVerified = TRUE AND isRec = TRUE " +
						   "AND AW.title NOT IN (SELECT title FROM favorites F2 WHERE F2.username = F.username ) " + 
						   "GROUP BY 1,2 " + 
						   "ORDER BY 3 DESC " + 
						   "LIMIT 10";
			Connection c = DBConnection.getConnection();
			ArrayList<Work> works = new ArrayList<Work>();
			
			try {
				PreparedStatement ps = c.prepareStatement(query);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				
				while( rs.next() ) {
					Work w = new Work.WorkBuilder(rs.getString(Work.TITLE_COLUMN),rs.getString(Work.CLASS_COLUMN))
								.releaseYear(rs.getString(Work.YEAR_COLUMN)).cover(rs.getString(Work.COVER_COLUMN))
								.description(rs.getString(Work.DESC_COLUMN))
								.rating(rs.getDouble(Work.RATING_COLUMN))
								.viewCount(rs.getInt(Work.VIEW_COLUMN))
								.isVerified(true).build();
					query = "SELECT workFrom, workFromClass " + 
							"FROM recommendation R, favorites F " + 
							"WHERE workFrom = F.title AND workFromClass = F.titleclass AND F.username = ? AND workTo = ? AND workToClass = ? " + 
							"GROUP BY 1, 2 " + 
							"LIMIT 3";
					ps = c.prepareStatement(query);
					ps.setString(1, username );
					ps.setString(2, w.getTitle() );
					ps.setString(3, w.getClassification() );
					ResultSet rs2 = ps.executeQuery();
					while( rs2.next() ) {
						w.addKeyword( rs2.getString("workFrom") + "(" + rs2.getString("workFromClass")  + ")" );
					}
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
				Connection c = DBConnection.getConnection();
				
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
					PreparedStatement ps = c.prepareStatement(query);
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
		Connection c = DBConnection.getConnection();
		
		try {
			PreparedStatement ps = c.prepareStatement(pstmst);
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
		Connection c = DBConnection.getConnection();
		
		try {
			PreparedStatement ps = c.prepareStatement(pstmst);
			ps.setString(1, title );
			ps.setString(2, classification );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void proposeGenre( String title, String classification, String genre ) throws SQLException {
		String stmt = "INSERT INTO genre(work,workclass,genre) VALUES (?,?,?)";
		Connection c = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = c.prepareStatement(stmt);
			pstmt.setString( 1, title );
			pstmt.setString( 2, classification );
			pstmt.setString( 3, genre );
			pstmt.execute();
		} catch( SQLException e ) {
			throw e;
		}
	}
	
	public static void proposeKeyword( String title, String classification, String keyword ) throws SQLException {
		String stmt = "INSERT INTO keyword(work,workclass,keyword) VALUES (?,?,?)";
		Connection c = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = c.prepareStatement(stmt);
			pstmt.setString( 1, title );
			pstmt.setString( 2, classification );
			pstmt.setString( 3, keyword );
			pstmt.execute();
		} catch( SQLException e ) {
			throw e;
		}
	}
	
	public static void favorite( String title, String classification, String user, boolean fav ) {
		String stmt = fav ? "INSERT INTO favorites(title,titleclass,username) VALUES (?,?,?)" : 
							"DELETE FROM favorites WHERE title = ? AND titleclass = ? AND username = ?";
		Connection c = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = c.prepareStatement(stmt);
			pstmt.setString( 1, title );
			pstmt.setString( 2, classification );
			pstmt.setString( 3, user );
			pstmt.execute();
		} catch( SQLException e ) {
			e.printStackTrace();
		}
	}
	
	public static void setFavorite( Work w, String username ) {
		String stmt = "SELECT * FROM favorites WHERE username = ? AND title = ? AND titleclass = ?";
		Connection c = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = c.prepareStatement(stmt);
			pstmt.setString( 1, username );
			pstmt.setString( 2, w.getTitle() );
			pstmt.setString( 3, w.getClassification() );
			ResultSet rs = pstmt.executeQuery();
			
			w.setFavorited(rs.next());
		} catch( SQLException e ) {
			e.printStackTrace();
		}
	}
}
