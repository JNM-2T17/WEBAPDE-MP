package com.themmt.model.database;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp.BasicDataSource;

public class DBConnection {
	private BasicDataSource ds;
	private String driverName;
	private String database;
	private String address;
	private String username;
	private String password;
	
	private static DBConnection con;
	
	private DBConnection() {
		driverName = "com.mysql.jdbc.Driver";
		username = "root";
		password = "put your password here";
		address = "jdbc:mysql://127.0.0.1:3306/";
		database = "tmi";
		ds = new BasicDataSource();
		ds.setDriverClassName( driverName );
		ds.setUrl( ( address ) + (database) );
		ds.setUsername( username );
		ds.setPassword( password );
	}
	
	public static Connection getConnection() 
			throws SQLException {
		if( con == null ) {
			con = new DBConnection();
		} 
		
		return con.ds.getConnection();
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
}
