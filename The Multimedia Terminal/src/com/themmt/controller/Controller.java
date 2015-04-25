package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.themmt.model.Rating;
import com.themmt.model.Review;
import com.themmt.model.User;
import com.themmt.model.Work;
import com.themmt.model.database.RatingDAO;
import com.themmt.model.database.RecommendationDAO;
import com.themmt.model.database.ReviewDAO;
import com.themmt.model.database.UserDAO;
import com.themmt.model.database.WorkDAO;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

    @SuppressWarnings("unused")
	private String getSearch( String searchStr ) {
    	String str = new Gson().toJson(WorkDAO.search(searchStr, WorkDAO.ALL,WorkDAO.TYPE));
    	return str;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch( request.getServletPath() ) {
			case "/start":
				request.getSession().setAttribute("home",WorkDAO.get(WorkDAO.HOME));
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
			case "/work":
				Work w = WorkDAO.get(request.getParameter("t"), request.getParameter("c") );
				int rateCtr = WorkDAO.getRatingCount(request.getParameter("t"), request.getParameter("c") );
				request.getSession().setAttribute("work", w );
				if( w != null ) {
					request.getSession().setAttribute("recommendations", RecommendationDAO.getRecommended(w.getTitle()));
					request.getSession().setAttribute("unrecommendations", RecommendationDAO.getUnrecommended(w.getTitle()));
					request.getSession().setAttribute("reviews",ReviewDAO.get(request.getParameter("t"), request.getParameter("c") ) );
				}
				request.getSession().setAttribute("rateCtr", rateCtr );
				request.getRequestDispatcher("work.jsp").forward(request, response);
				break;
			case "/recommend":
				request.getRequestDispatcher("recommend.jsp").forward(request, response);
				break;
			case "/login":
				request.getSession().setAttribute("fail", false);
				request.getSession().setAttribute("registered", false );
				request.getSession().setAttribute("isAdmin", false);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				break;
			case "/logout":
				request.getSession().setAttribute("username", null);
				request.getRequestDispatcher("start").forward(request, response);
				break;
			case "/search":
				request.setAttribute( "crit", request.getParameter("s") );
				request.getRequestDispatcher("search.jsp").forward(request,response);
				break;
			case "/review":
				request.setAttribute("t", request.getParameter("t"));
				request.setAttribute("c", request.getParameter("c"));
				if (request.getSession().getAttribute("username") != null) {
					request.getRequestDispatcher("review.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("work.jsp").forward(request, response);
				}
				break;
			default:
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch( request.getServletPath() ) {
			case "/start":
				request.getSession().setAttribute("home",WorkDAO.get(WorkDAO.HOME));
				request.getRequestDispatcher("index.jsp").forward(request, response);
				break;
			case "/login":
				if( (Boolean)request.getSession().getAttribute("registered") ) {
					User u = (User)(request.getSession().getAttribute("user"));
					request.getSession().setAttribute("username", u.getUsername() );
					request.getRequestDispatcher("login.jsp").forward(request, response);	
					return;
				}
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				if(UserDAO.isMatch(username, password)) {
					request.getSession().setAttribute("username", username);
					request.getSession().setAttribute("isAdmin", UserDAO.isAdmin(username));
					request.getRequestDispatcher("start").forward(request, response);
				} else {
					request.getSession().setAttribute("fail", true);
					request.getSession().setAttribute("username", username);
					request.getRequestDispatcher("login.jsp").forward(request, response);	
				}
				break;
			case "/approvedWork":
				WorkDAO.approveWork( request.getParameter("title"), request.getParameter("class") );
				response.getWriter().println("SUCCESS");
				break;
			case "/search":
				response.getWriter().println( getSearch( request.getParameter("s") ) );
				break;
			case "/review":
				username = request.getSession().getAttribute("username").toString();
				String titleclass = request.getParameter("titleclass");
				String review = request.getParameter("reviewContent");
				String rating = request.getParameter("r");
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
			default:
		}
	}

}
