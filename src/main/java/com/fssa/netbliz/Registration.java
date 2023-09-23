package com.fssa.netbliz;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Customer;
import com.fssa.netbliz.service.CustomerService;

/**
 * Servlet implementation class registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		long phone = Long.parseLong(request.getParameter("phone"));
		String password = request.getParameter("pass");
		String confirmPassword = request.getParameter("confirm");

		Customer customer = new Customer(firstName, lastName, phone, email, password, confirmPassword);

		CustomerService cusService = new CustomerService();

		try {
			cusService.addCustomer(customer);
			System.out.println( "Customer Account Added successfully");
			request.setAttribute("successMsg", "Welcome to the application");
			request.setAttribute("path", "./login.jsp"); 
			
			RequestDispatcher rd = request.getRequestDispatcher("./registration.jsp");
			rd.forward(request, response);
			
		} catch (ServiceException e) {
			request.setAttribute("errorMsg", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("./registration.jsp");
			request.setAttribute("path", "./registration.jsp");
			System.out.println( "Customer Account Adding failed");
			rd.forward(request, response);
		}

	}

}
