package com.themmt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GoToWorkApproveServlet
 */
@WebServlet("/workApprove")
public class GoToWorkApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToWorkApproveServlet() {
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
		request.getSession().setAttribute("title", request.getParameter("title"));
		request.getSession().setAttribute("releaseYear", request.getParameter("releaseYear"));
		request.getSession().setAttribute("description", request.getParameter("description"));
		request.getSession().setAttribute("class", request.getParameter("class"));
		request.getRequestDispatcher("adminWorkApproval.jsp").forward(request, response);
	}

}
