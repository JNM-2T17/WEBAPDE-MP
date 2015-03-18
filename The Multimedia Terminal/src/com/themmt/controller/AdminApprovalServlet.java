package com.themmt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.database.WorkDAO;

/**
 * Servlet implementation class AdminApprovalServlet
 */
public class AdminApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminApprovalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().setAttribute("proposal0",WorkDAO.get(WorkDAO.PROPOSAL,WorkDAO.TYPE));
		request.getSession().setAttribute("proposal1",WorkDAO.get(WorkDAO.PROPOSAL,WorkDAO.ALPHA));
		request.getSession().setAttribute("proposal2",WorkDAO.get(WorkDAO.PROPOSAL,WorkDAO.DATE));
		request.getRequestDispatcher("adminApproval.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
