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
			ps.setInt(9, user.getIsFlagged() );
			System.out.println(ps);
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw e;
		}
		
	}
	
	
	public static Iterator get()
			throws IllegalArgumentException {
			String query = "SELECT * FROM user";

			
			ArrayList<User> users = new ArrayList<User>();
			
			try {
				PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				
				while( rs.next() ) {
					User u = new User(rs.getString("username"),rs.getString("fname"),
							rs.getString("lname"),rs.getString("gender"), 
							rs.getString("email"),rs.getString("password"), 
							rs.getString("profpic"),rs.getString("description"),
							rs.getInt("isFlagged"));
							users.add(u);
				}
			} catch(SQLException se) {
				se.printStackTrace();
			}
			
			return users.iterator();
		}
	
	public static Boolean isMatch(String username, String password)
			{
				
			//cross the inputs against all values
			Iterator<User> iterator = UserDAO.get();
			
			while(iterator.hasNext())
				{
				User temp = iterator.next();
				if(temp.getUsername().equals(username) && temp.getPassword().equals(password))
					{
					System.out.println("you are a valid user!");	
					return true;
					}
				else
					{
					System.out.println("Invalid combo");	
					return false;	
					}
				}
			return false;
			}

	
}
	
