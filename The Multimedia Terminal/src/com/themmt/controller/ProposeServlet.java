package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.Work;
import com.themmt.model.database.WorkDAO;

/**
 * Servlet implementation class ProposeServlet
 */
public class ProposeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//prevent alert from showing
		request.getSession().setAttribute("noProposal", true);
		
		//initialize proposalSuccess
		request.getSession().setAttribute("proposalSuccess",true);
		
		//forward to proposal page
        request.getRequestDispatcher("propose.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//allow alerts to show
		request.getSession().setAttribute("noProposal", false);
		
		//get parameters from form
		String title = request.getParameter("title");
		String releaseYear = request.getParameter("releaseYear");
		String cover = null;
		String classification = request.getParameter("classification");
		String description = request.getParameter("description");
		int viewCount = 0;
		boolean isVerified = false;
		
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
		request.getRequestDispatcher("propose.jsp").forward(request,response);
	}

}
