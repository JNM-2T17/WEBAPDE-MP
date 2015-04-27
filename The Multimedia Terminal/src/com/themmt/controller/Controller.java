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
import com.themmt.model.Creator;
import com.themmt.model.Rating;
import com.themmt.model.Review;
import com.themmt.model.User;
import com.themmt.model.Work;
import com.themmt.model.WorkRecommendation;
import com.themmt.model.database.CreatorDAO;
import com.themmt.model.database.GenreDAO;
import com.themmt.model.database.KeywordDAO;
import com.themmt.model.database.RatingDAO;
import com.themmt.model.database.RecommendationDAO;
import com.themmt.model.database.ReviewDAO;
import com.themmt.model.database.UserDAO;
import com.themmt.model.database.WorkDAO;
import com.themmt.model.database.WorkRecommendationDAO;

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
				String title = request.getParameter("t");
				String classif = request.getParameter("c");
				int isRec = Integer.parseInt(request.getParameter("isRec"));
				request.setAttribute("t", title);
				request.setAttribute("c", classif);
				request.setAttribute("isRec", isRec == 1);
				request.setAttribute("recs", WorkRecommendationDAO.get(title, classif, request.getSession().getAttribute("username").toString(), isRec));
				request.setAttribute("unrecs", WorkRecommendationDAO.get(title, classif, request.getSession().getAttribute("username").toString(), 1 - isRec));
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
			case "/adminApproval":
				request.getSession().setAttribute("proposal0",WorkDAO.get(WorkDAO.PROPOSAL,WorkDAO.TYPE));
				request.getSession().setAttribute("proposal1",WorkDAO.get(WorkDAO.PROPOSAL,WorkDAO.ALPHA));
				request.getSession().setAttribute("proposal2",WorkDAO.get(WorkDAO.PROPOSAL,WorkDAO.DATE));
				request.getRequestDispatcher("adminApproval.jsp").forward(request, response);
				break;
			case "/adminKeyGenAppro":
				request.getSession().setAttribute("proposal3",GenreDAO.get());
				request.getSession().setAttribute("proposal4",KeywordDAO.get());
				request.getRequestDispatcher("adminKeyGenAppro.jsp").forward(request, response);
				break;
			case "/adminCreatorAppro":
				request.getSession().setAttribute("proposal5",CreatorDAO.get());
				request.getRequestDispatcher("adminCreatorAppro.jsp").forward(request, response);
				break;
			case "/propose":
			case "/proposeMedia":
			case "/proposeCreator":
					//prevent alert from showing
				request.getSession().setAttribute("noProposal", true);
				
				//initialize proposalSuccess
				request.getSession().setAttribute("proposalSuccess",true);
				
				//forward to proposal page
		        request
		        	.getRequestDispatcher(request.getServletPath().equals("/propose") ? "propose.jsp" : 
		        							( request.getServletPath().equals("/proposeMedia") ? "proposeMedia.jsp"
		        									:"proposeCreator.jsp") )
		        	.forward(request, response);
		        break;
			case "/register":
		        request.getSession().setAttribute("fail", false);
				request.getRequestDispatcher("register.jsp").forward(request, response);
				break;
			case "/admin":
				request.setAttribute("propCount", WorkDAO.getCount(WorkDAO.PROPOSAL));
				request.setAttribute("KeyGenCount", GenreDAO.getNotVerCount() + KeywordDAO.getNotVerCount());
				request.setAttribute("CreatorCount", CreatorDAO.getNotVerCount());
				request.getRequestDispatcher("admin.jsp").forward(request, response);
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
					request.getSession().setAttribute("registered",false);
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
					request.getSession().setAttribute("registered", false);
					request.getSession().setAttribute("username", username);
					request.getRequestDispatcher("login.jsp").forward(request, response);	
				}
				break;
			case "/approvedWork":
				WorkDAO.approveWork( request.getParameter("title"), request.getParameter("class"), Boolean.parseBoolean(request.getParameter("approve"))  );
				response.getWriter().println("SUCCESS");
				break;
			case "/proposeCreator":
				//allow alerts to show
				request.getSession().setAttribute("noProposal", false);
				
				//get parameters from form
				String name = request.getParameter("name");
				String bio = request.getParameter("bio");
				String trivia = request.getParameter("trivia");
				boolean isVerified = false;
				
				//generate work
				Creator c = new Creator(name, bio, trivia, isVerified);
				try { //try adding work
					CreatorDAO.add(c);

					request.getSession().setAttribute("name", name );
					//mark as success
					request.getSession().setAttribute("proposalSuccess", true );
				} catch (SQLException e) {
					e.printStackTrace();
					//mark proposal as false
					request.getSession().setAttribute("proposalSuccess", false );
					
					//define proposal error
					request.getSession().setAttribute("proposalError", 
							e.getErrorCode() == 1062 ? "\"" + name + "\" already exists" : 
											   "Failed to add \"" + name + "\"." );
				}
				request.getRequestDispatcher("proposeCreator.jsp").forward(request, response);
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
				
				Rating ra = new Rating(username, workTitle, ratingu, titleclass);
						
				try {
					RatingDAO.add(ra);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				Review re = new Review(username, workTitle, review, isFlagged, titleclass, ratingu);
				
				try { //try adding Review
					ReviewDAO.add(re);
					response.getWriter().println("work?t=" + workTitle + "&c=" + titleclass);
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
			case "/approveGenre":
				GenreDAO.approveGenre(request.getParameter("title"), request.getParameter("classif"), request.getParameter("genre"), Boolean.parseBoolean(request.getParameter("approve")) );
				response.getWriter().println("");
				break;
			case "/approveKey":
				KeywordDAO.approveKeyword(request.getParameter("title"), request.getParameter("classif"), request.getParameter("key"), Boolean.parseBoolean(request.getParameter("approve")) );
				response.getWriter().println("");
				break;	
			case "/approveCreator":
				CreatorDAO.approveCreator(request.getParameter("name"), Boolean.parseBoolean(request.getParameter("approve")));
				response.getWriter().println("");
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
				break;
			case "/propose":
				//allow alerts to show
				request.getSession().setAttribute("noProposal", false);
				
				//get parameters from form
				String title = request.getParameter("title");
				String releaseYear = request.getParameter("releaseYear");
				String cover = null;
				String classification = request.getParameter("classification");
				String description = request.getParameter("description");
				int viewCount = 0;
				isVerified = false;
				
				//generate work
				Work w = new Work.WorkBuilder(title,classification).releaseYear(releaseYear)
							.cover(cover).description(description).viewCount(viewCount)
							.isVerified(isVerified).build();
				try { //try adding work
					WorkDAO.add(w);
					
					//mark as success
					request.getSession().setAttribute("proposalSuccess", true );
				} catch (SQLException e) {
					e.printStackTrace();
					//mark proposal as false
					request.getSession().setAttribute("proposalSuccess", false );
					
					//define proposal error
					request.getSession().setAttribute("proposalError", 
							e.getErrorCode() == 1062 ? "\"" + title + "\" already exists as " + 
												( ( classification.charAt(0) == 'a' ||
												  classification.charAt(0) == 'e' ||
												  classification.charAt(0) == 'i' ||
												  classification.charAt(0) == 'o' ||
												  classification.charAt(0) == 'u' ) ? "an " : "a " )
												+ classification + "." : 
											   "Failed to add \"" + title + "\"." );
					
					//set values
					request.getSession().setAttribute("releaseYear", releaseYear );
					request.getSession().setAttribute("classification", classification );
					request.getSession().setAttribute("description",description);
				} finally {
					
					//set title
					request.getSession().setAttribute("title", title );
				}
				
				//return to propose page
				request.getRequestDispatcher("proposeMedia.jsp").forward(request,response);
				break;
			case "/register":
				username = request.getParameter("username");
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String email = request.getParameter("email");
				password = request.getParameter("password");
				String gender = request.getParameter("gender");
				description = request.getParameter("description");
				String profpic = "default";
				isFlagged = false;

				User u = new User(username, fname, lname, gender,
								  email, password, profpic, description, isFlagged);
				
				try { //try adding User
					UserDAO.add(u);
					request.getSession().setAttribute("user", u);
					request.getSession().setAttribute("registered", true);
					request.getSession().setAttribute("fail", false);
					request.getRequestDispatcher("login").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
					request.getSession().setAttribute("fail", true);
					request.getSession().setAttribute("uname", username);
					request.getSession().setAttribute("fname", fname);
					request.getSession().setAttribute("lname", lname);
					request.getSession().setAttribute("gender", gender);
					request.getSession().setAttribute("email", email);
					request.getSession().setAttribute("password", password);
					System.out.println("It failed!!!!!");
					request.getRequestDispatcher("register.jsp").forward(request, response);	
					//Mod page or make a popup window to indicate that the user already exists
				}	
				break;
			case "/recommend":
				try {
					WorkRecommendationDAO.add( new WorkRecommendation(request.getSession().getAttribute("username").toString(), 
							request.getParameter("workFrom"), 
							request.getParameter("workTo"), 
							(request.getParameter("isRec").equals("true") ? 1 : 0), 
							request.getParameter("workFromClass"), 
							request.getParameter("workToClass")),
							Boolean.parseBoolean(request.getParameter("add")));
				} catch (NumberFormatException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}		
				
				response.getWriter().println("");
				break;
			case "/flag":
				if( !request.getParameter("username").equals(request.getSession().getAttribute("username") ) ) {
					switch(request.getParameter("id")) {
						case "flagUser":
							try {
								UserDAO.flag(request.getParameter("username"));
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							break;
						case "flagReview": 
							try {
								ReviewDAO.flag(request.getParameter("username"),request.getParameter("title"),request.getParameter("titleClass") );
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						   break;
						default:
					}
				}
				break;
			default:
		}
	}
}
