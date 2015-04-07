package com.themmt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.Work;
import com.themmt.model.database.RecommendationDAO;
import com.themmt.model.database.WorkDAO;

/**
 * Servlet implementation class WorkServlet
 */
public class WorkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Work w = WorkDAO.get(request.getParameter("t"), request.getParameter("c") );
		
		//Hijack and insert crap here
		
		
		int rateCtr = WorkDAO.getRatingCount(request.getParameter("t"), request.getParameter("c") );
		request.getSession().setAttribute("work", w );
		request.getSession().setAttribute("recommendations", RecommendationDAO.getRecommended(w.getTitle()));
		request.getSession().setAttribute("rateCtr", rateCtr );
		request.getRequestDispatcher("work.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
