package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.User;
import com.themmt.model.database.UserDAO;

/**
/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getSession().setAttribute("fail", false);
		request.getRequestDispatcher("register.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");
		String profpic = "default";
		boolean isFlagged = false;

		User u = new User(username, fname, lname, gender,
						  email, password, profpic, description, isFlagged);
		
		try { //try adding User
			UserDAO.add(u);
			request.getSession().setAttribute("user", u);
			request.getSession().setAttribute("registered", true);
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
	}
}
