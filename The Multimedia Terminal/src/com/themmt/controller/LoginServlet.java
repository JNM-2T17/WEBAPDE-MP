package com.themmt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.User;
import com.themmt.model.database.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().setAttribute("fail", false);
		request.getSession().setAttribute("registered", false );
		request.getSession().setAttribute("isAdmin", false);
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

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
	}

}
