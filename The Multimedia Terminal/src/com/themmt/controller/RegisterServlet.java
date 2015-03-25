package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.User;
import com.themmt.model.database.UserDAO;
import com.themmt.model.database.WorkDAO;

/**
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
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
		String confirmPassword = request.getParameter("confirmpassword");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");
		String profpic = "default";
		int isFlagged = 0;
		System.out.println("It tried");

		User u = new User(username, fname, lname, gender,
						  email, password, profpic, description, isFlagged);
		
		System.out.println("username:" + u.getUsername());
		System.out.println("fname:" + u.getFname());
		System.out.println("lname:" + u.getLname());
		System.out.println("email:" + u.getEmail());
		System.out.println("password:" + u.getPassword());
		System.out.println("gender:" + u.getGender());
		System.out.println("description:" + u.getDescription());
		if(password.equals(confirmPassword))
		{
			try
				{ //try adding User
				UserDAO.add(u);
				System.out.println("It actually worked");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				} 
			catch (SQLException e)
				{
				e.printStackTrace();
				System.out.println("It failed!!!!!");
				request.getRequestDispatcher("register.jsp").forward(request, response);	
				//Mod page or make a popup window to indicate that the user already exists
				}
		}
		else
			{
			System.out.println("Please ensure that your passwords match");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			//Mod page or make a popup window to indicate that the passwords don't match
			}
//else
	//request.getRequestDispatcher("index.jsp").forward(request,response);
//Tell the user that they messed up


}
		
		
		
	

}
