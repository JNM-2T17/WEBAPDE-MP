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
		double ratingu = Double.parseDouble(rating);
		
		System.out.println("username: " +username);
		System.out.println("titleclass: " +titleclass);
		System.out.println("review: " +review);
		System.out.println("rating: " +rating);
		System.out.println("title: " +title);
		System.out.println("isFlagged: " +isFlagged);


		
		Rating r = new Rating(title, username, ratingu, titleclass);
				
		try {
			System.out.println( r.getUsername() + " " + request.getSession().getAttribute("username").toString() );
			System.out.println( "SHIT" );
			RatingDAO.add(r);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		Review u = new Review(title, username, review, isFlagged, titleclass);
		
		try { //try adding Review
			ReviewDAO.add(u);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		System.out.println("Bacon Bacon Bacon!");
		
	}

}
