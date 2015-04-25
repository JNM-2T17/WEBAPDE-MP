package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.Review;
import com.themmt.model.database.ReviewDAO;
import com.themmt.model.database.UserDAO;

/**
 * Servlet implementation class FlagServlet
 */
@WebServlet("/flag")
public class FlagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlagServlet() {
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
		String user = (String)request.getSession().getAttribute("username");
		System.out.println("Do Post eggs");
		System.out.println("id:"+ request.getParameter("id"));

		switch(request.getParameter("id"))
			{
		case "flagUser":System.out.println("Flag a user!");
						System.out.println("username:"+ request.getParameter("username"));

						try {
							UserDAO.flag(request.getParameter("username"));
							System.out.println("Successfully flagged a user");
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						break;
						
		case "flagReview": System.out.println("Flag a review!");
						   System.out.println("username:"+ request.getParameter("username"));
						   System.out.println("title:"+ request.getParameter("title"));
						   System.out.println("titleclass:"+ request.getParameter("titleClass"));
						   try {
							  
								ReviewDAO.flag(request.getParameter("username"),request.getParameter("title"),request.getParameter("titleClass") );
								System.out.println("Successfully flagged a review");
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						   break;
								
			
			}

	}

}
