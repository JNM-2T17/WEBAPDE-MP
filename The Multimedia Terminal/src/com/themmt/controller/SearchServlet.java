package com.themmt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.database.WorkDAO;

/**
 * Servlet implementation class Search
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchStr = request.getParameter("s");
		request.getSession().setAttribute("search0",WorkDAO.search(searchStr, WorkDAO.ALL,WorkDAO.TYPE));
		request.getSession().setAttribute("search1",WorkDAO.search(searchStr, WorkDAO.ALL,WorkDAO.ALPHA));
		request.getSession().setAttribute("search2",WorkDAO.search(searchStr, WorkDAO.ALL,WorkDAO.RATING));
		request.getSession().setAttribute("search3",WorkDAO.search(searchStr, WorkDAO.ALL,WorkDAO.DATE));
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp");

		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
