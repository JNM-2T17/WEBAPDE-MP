package com.themmt.model.database;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.themmt.model.Work;

public class WorkDAO {
	
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
}
