/**
 * 
 */
package com.jsoft.login;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static String INDEX_JSP		="index.jsp";	
	private static String HOME_JSP		= "home.jsp";
	private static String LOGOUT_JSP		= "logout.jsp";
	private static String GETLOGIN_JSP 			= "getlogin.jsp";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 		{
		pageControll(request,response);

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 		{
		pageControll(request,response);

	}
	private void pageControll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String forward="";
	System.out.println("Controller.pageControll()");
		
		// Get a map of the request parameters
		
		Map parameters = request.getParameterMap();
		RequestDispatcher view=null;

		
		if (parameters.containsKey("_gtlogin"))
		{
		
			forward = GETLOGIN_JSP;
		}
		else if (parameters.containsKey("_home"))
		{
		
			forward = HOME_JSP;
		}
		else if (parameters.containsKey("_logout"))
		{
		
			forward = LOGOUT_JSP;
		}
		
		else 
		{
			forward = INDEX_JSP;
		}

		view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}
