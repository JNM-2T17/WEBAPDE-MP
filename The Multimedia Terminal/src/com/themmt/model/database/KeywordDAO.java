package com.themmt.model.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.PreparedStatement;

import com.themmt.model.Keyword;

public class KeywordDAO {
	/**
	 * adds a Keyword to the database
	 * @param Keyword to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Keyword keyword ) throws SQLException {
		
		//INSERT INTO `tmi`.`keyword` 
		String stmt = "INSERT INTO keyword VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, keyword.getKeyword() );
			ps.setString(2, keyword.getTitle() );
			ps.setBoolean(3, keyword.isVerified() );
			ps.setString(4, keyword.getTitleclass() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static ArrayList<Keyword> get()
			throws IllegalArgumentException {
		String query = "SELECT * FROM keyword";
		ArrayList<Keyword> keywords = new ArrayList<Keyword>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Keyword u = new Keyword(rs.getString(Keyword.KEYWORD_COLUMN),rs.getString(Keyword.TITLE_COLUMN),
						rs.getBoolean(Keyword.ISVERIFIED_COLUMN), rs.getString(Keyword.TITLECLASS_COLUMN));
				keywords.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return keywords;
	}
	
	public static int getCount()
			throws IllegalArgumentException {
			String query = null;
			query = "SELECT COUNT(*) FROM `keyword`";

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
	
	public static int getNotVerCount()
			throws IllegalArgumentException {
			String query = null;
			query = "SELECT COUNT(*) FROM `keyword` WHERE isVerified=0";

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
	
	public static void approveKeyword( String title, String classification, String keyword ) {
		String pstmst = "UPDATE keyword SET isVerified = 1 WHERE title = ? AND class = ? AND keyword = ?";
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(pstmst);
			ps.setString(1, title );
			ps.setString(2, classification );
			ps.setString(3, keyword );
			ps.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}