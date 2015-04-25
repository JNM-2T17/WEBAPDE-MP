package com.themmt.model.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.PreparedStatement;

import com.themmt.model.Genre;

public class GenreDAO {
	/**
	 * adds a Genre to the database
	 * @param Genre to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( Genre genre ) throws SQLException {
		
		//INSERT INTO `tmi`.`genre` 
		String stmt = "INSERT INTO rating VALUES (?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, genre.getGenre() );
			ps.setString(2, genre.getTitle() );
			ps.setBoolean(3, genre.isVerified() );
			ps.setString(4, genre.getTitleclass() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static Iterator get()
			throws IllegalArgumentException {
		String query = "SELECT * FROM genre";
		ArrayList<Genre> genres = new ArrayList<Genre>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				Genre u = new Genre(rs.getString(Genre.GENRE_COLUMN),rs.getString(Genre.TITLE_COLUMN),
						rs.getBoolean(Genre.ISVERIFIED_COLUMN), rs.getString(Genre.TITLECLASS_COLUMN));
				genres.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return genres.iterator();
	}
	
	public static int getCount()
			throws IllegalArgumentException {
			String query = null;
			query = "SELECT COUNT(*) FROM `genre`";

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
			query = "SELECT COUNT(*) FROM `genre` WHERE isVerified=0";

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
	
	public static void approveGenre( String title, String classification ) {
		String pstmst = "UPDATE genre SET isVerified = 1 WHERE title = ? AND class = ?";
		
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