package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.Rating;
import com.themmt.model.Review;
import com.themmt.model.database.RatingDAO;
import com.themmt.model.database.ReviewDAO;

/**
 * Servlet implementation class ReviewServlet
 */
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
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
		String username = request.getSession().getAttribute("username").toString();
		String titleclass = request.getParameter("titleclass");
		String review = request.getParameter("reviewContent");
		String rating = request.getParameter("r");
		String title = request.getParameter("reviewTitle");
		boolean isFlagged = false;
		String workTitle = request.getParameter("title");
		
		double ratingu = Double.parseDouble(rating);
		
		Rating r = new Rating(username, workTitle, ratingu, titleclass);
				
		try {
			System.out.println( r.getUsername() + " " + request.getSession().getAttribute("username").toString() );
			System.out.println( "SHIT" );
			RatingDAO.add(r);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Review u = new Review(username, workTitle, review, isFlagged, titleclass, ratingu);
		
		try { //try adding Review
			ReviewDAO.add(u);
			request.getRequestDispatcher("start").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
