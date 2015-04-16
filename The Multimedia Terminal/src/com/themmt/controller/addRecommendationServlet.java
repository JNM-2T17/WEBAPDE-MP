package com.themmt.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.themmt.model.Work;
import com.themmt.model.WorkRecommendation;
import com.themmt.model.database.WorkRecommendationDAO;

/**
 * Servlet implementation class addRecommendationServlet
 */
@WebServlet("/addRecommendation")
public class addRecommendationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRecommendationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("I am in the page for recommending stuff");
	
		String user = (String)request.getSession().getAttribute("username");
		String workFrom =((Work) request.getSession().getAttribute("work")).getTitle();
		String workFromClass=((Work) request.getSession().getAttribute("work")).getClassification();
		String workTo=request.getParameter("workTo");
		String workToClass=request.getParameter("workToClass");
		int isRec =Integer.parseInt(request.getParameter("isRec"));
		
		System.out.println("User: "+ user);
		System.out.println("WorkFrom: "+workFrom);
		System.out.println("WorkFromClass: "+workFromClass);
		System.out.println("WorkTo: "+workTo);
		System.out.println("WorkToClass: "+workToClass);
		System.out.println("isRec: "+ isRec);
		WorkRecommendation recommendation = new WorkRecommendation(user,workFrom,workTo,isRec,workFromClass,workToClass);
		
		

		
		// TODO Auto-generated method stub
		try {
			WorkRecommendationDAO.add(recommendation );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
