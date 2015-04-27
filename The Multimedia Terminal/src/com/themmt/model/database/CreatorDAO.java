package com.themmt.model.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.PreparedStatement;

import com.themmt.model.Creator;

public class CreatorDAO {
	/**
	 * adds a Genre to the database
	 * @param Genre to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Creator creator ) throws SQLException {
		
		//INSERT INTO `tmi`.`creator` 
		String stmt = "INSERT INTO creator VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, creator.getName() );
			ps.setString(2, creator.getBio() );
			ps.setString(3, creator.getTrivia() );
			ps.setBoolean(4, creator.isVerified() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static ArrayList<Creator> get()
			throws IllegalArgumentException {
		String query = "SELECT * FROM creator";
		ArrayList<Creator> creators = new ArrayList<Creator>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Creator u = new Creator(rs.getString(Creator.NAME_COLUMN),rs.getString(Creator.BIO_COLUMN),
						rs.getString(Creator.TRIVIA_COLUMN), rs.getBoolean(Creator.VERIFIED_COLUMN));
				//System.out.println( u.getName() );
				creators.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return creators;
	}
	
	public static int getCount()
			throws IllegalArgumentException {
			String query = null;
			query = "SELECT COUNT(*) FROM `creator`";

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
			query = "SELECT COUNT(*) FROM `creator` WHERE isVerified=0";

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
	
	public static void approveCreator( String name, boolean approve ) {
		String pstmst = approve ? "UPDATE creator SET isVerified = 1 " : "DELETE FROM creator ";
		pstmst += "WHERE name = ?";
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(pstmst);
			ps.setString( 1, name );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}