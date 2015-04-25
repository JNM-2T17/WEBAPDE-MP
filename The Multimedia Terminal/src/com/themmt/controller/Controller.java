package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.themmt.model.CookieFinder;
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
    
    private void restoreUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Cookie c = CookieFinder.findCookie(request, "username");
		if( c != null ) {
			request.getSession().setAttribute("username", c.getValue() );
		}
		c = CookieFinder.findCookie(request, "isAdmin");
		if( c != null ) {
			request.getSession().setAttribute("isAdmin", Boolean.parseBoolean(c.getValue()) );
		}
    }

    private void start(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getSession().setAttribute("home",WorkDAO.get(WorkDAO.HOME));
		request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
	private String getSearch( String searchStr ) {
		String str = new Gson().toJson(WorkDAO.search(searchStr, WorkDAO.ALL,WorkDAO.TYPE));
    	return str;
    }
	
	private String getFavorites( String username ) {
		String str = new Gson().toJson(WorkDAO.getFavorites(username));
    	return str;
	}
	
	private String getTaste( String username ) {
		String str = new Gson().toJson(WorkDAO.getTasteRecommendations(username));
    	return str;
	}
	
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie c = CookieFinder.findCookie(request, "username");
		if( c != null ) {
			c.setMaxAge(0);
			response.addCookie(c);
		}
		c = CookieFinder.findCookie(request, "isAdmin");
		if( c != null ) {
			c.setMaxAge(0);
			response.addCookie(c);
		}
		request.getSession().invalidate();
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		restoreUser(request, response);
		
		switch( request.getServletPath() ) {
			case "/logout":
				logout(request, response);
				//fall-through
			case "/start":
				start(request, response);
				break;
			case "/work":
				Work w = WorkDAO.get(request.getParameter("t"), request.getParameter("c") );
				int rateCtr = WorkDAO.getRatingCount(request.getParameter("t"), request.getParameter("c") );
				WorkDAO.incrementView(request.getParameter("t"), request.getParameter("c") );
				if( request.getSession().getAttribute("username") != null ) {
					WorkDAO.setFavorite( w, request.getSession().getAttribute("username").toString() );
				}
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
				logout(request, response);
				request.getSession().setAttribute("fail", false);
				request.getSession().setAttribute("registered", false );
				request.getSession().setAttribute("isAdmin", false);
				request.getRequestDispatcher("login.jsp").forward(request, response);
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
			case "/favorite":
				request.getRequestDispatcher("favorites.jsp").forward(request,response);
				break;
			default:
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		restoreUser(request, response);
		
		switch( request.getServletPath() ) {
			case "/start":
				start(request, response);
				break;
			case "/login":
				if( request.getSession().getAttribute("registered") != null && 
				(Boolean)request.getSession().getAttribute("registered") ) {
					User u = (User)(request.getSession().getAttribute("user"));
					request.getSession().setAttribute("username", u.getUsername() );
					request.getRequestDispatcher("login.jsp").forward(request, response);	
					return;
				}
				logout(request, response);
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				if(UserDAO.isMatch(username, password)) {
					request.getSession().setAttribute("username", username);
					request.getSession().setAttribute("isAdmin", UserDAO.isAdmin(username));
					Cookie c = new Cookie( "username", username );
					c.setMaxAge( 604800 );
					response.addCookie(c);
					c = new Cookie( "isAdmin", request.getSession().getAttribute("isAdmin").toString() );
					c.setMaxAge( 604800 );;
					response.addCookie(c);
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
				break;
			case "/addGenre":
				try {
					WorkDAO.proposeGenre( request.getParameter("title"),request.getParameter("class"),
										request.getParameter("genre") );
					response.getWriter().print("");
				} catch( SQLException se ) {
					se.printStackTrace();
					response.getWriter().print("The genre " + request.getParameter("genre") + " is already proposed.");
				}
				break;
			case "/addKey":
				try {
					WorkDAO.proposeKeyword( request.getParameter("title"),request.getParameter("class"),
										request.getParameter("keyword") );
					response.getWriter().print("");
				} catch( SQLException se ) {
					se.printStackTrace();
					response.getWriter().print("The keyword " + request.getParameter("keyword") + " is already proposed.");
				}
				break;
			case "/favorite":
				if( Boolean.parseBoolean(request.getParameter("init") ) ) {
					response.getWriter().print(getFavorites(request.getSession().getAttribute("username").toString()));
				} else {
					WorkDAO.favorite(request.getParameter("title"),request.getParameter("class"),
										request.getSession().getAttribute("username").toString(),
										Boolean.parseBoolean(request.getParameter("fav")));
					response.getWriter().print("");
				}
				break;
			case "/taste":
				response.getWriter().print(getTaste(request.getSession().getAttribute("username").toString()));
			default:
		}
	}
}
