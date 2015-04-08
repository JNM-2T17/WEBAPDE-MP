package com.themmt.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.database.DBConnection;

/**
 * Servlet implementation class ApprovedWorkServlet
 */
@WebServlet("/approvedWork")
public class ApprovedWorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApprovedWorkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pstmst = "UPDATE WORK SET isVerified=1 WHERE title = ?";
		
		try {
			PreparedStatement ps = DBConnection.getConnection().prepareStatement(pstmst);
			ps.setString(1, request.getParameter("title") );
			//ps.setInt(2, Integer.parseInt(request.getParameter("releaseYear")) );
			//ps.setString(3, request.getParameter("class") );
			ps.execute();
			
			request.getRequestDispatcher("start").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
