package com.themmt.model.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import java.sql.PreparedStatement;
import com.themmt.model.User;

public class UserDAO {
	/**
	 * adds a User to the database
	 * @param User to be added
	 * @throws SQLException when duplicate entries occur
	 */
	public static void add( User user ) throws SQLException {
		
		//INSERT INTO `tmi`.`user` 
		String stmt = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(stmt);
			ps.setString(1, user.getUsername() );
			ps.setString(2, user.getFname() );
			ps.setString(3, user.getLname() );
			ps.setString(4, user.getGender() );
			ps.setString(5, user.getEmail() );
			ps.setString(6, user.getPassword() );
			ps.setString(7, user.getProfpic() );
			ps.setString(8, user.getDescription() );
			ps.setBoolean(9, user.isFlagged() );
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static Iterator get()
			throws IllegalArgumentException {
		String query = "SELECT u.username, u.fname, u.lname, u.gender, u.email, u.password, u.profpic, u.description, u.isFlagged, a.username as adminName FROM user u LEFT JOIN admin a ON u.username = a.username;";
		ArrayList<User> users = new ArrayList<User>();
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while( rs.next() ) {
				User u = new User(rs.getString(User.USERNAME_COLUMN),rs.getString(User.FNAME_COLUMN),
						rs.getString(User.LNAME_COLUMN),rs.getString(User.GENDER_COLUMN), 
						rs.getString(User.EMAIL_COLUMN),rs.getString(User.PASSWORD_COLUMN), 
						rs.getString(User.PROFPIC_COLUMN),rs.getString(User.DESCRIPTION_COLUMN),
						rs.getBoolean(User.FLAG_COLUMN));

				if(rs.getString(User.ADMIN_COLUMN)!=null){
					u.setAdmin(true);
				}

				users.add(u);
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		
		return users.iterator();
	}
	
	public static Boolean isMatch(String username, String password) {

		Iterator iterator = UserDAO.get();

		while(iterator.hasNext()) {
			User temp = (User)iterator.next();

			if(temp.getUsername().equals(username) && temp.getPassword().equals(password)) {
				return true;
			}
		}

		return false;
	}
	
	

	public static Boolean isAdmin(String username) {
		

		Iterator iterator = UserDAO.get();

		while(iterator.hasNext()) {
			User temp = (User)iterator.next();
			if(temp.getUsername().equals(username)){
				return temp.isAdmin();
			}
		}

		return false;
}
}
	
