package com.fssa.netbliz;

import java.io.IOException;

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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
			if (cusService.addCustomer(customer)) {
				
				response.sendRedirect("./login.jsp");

			}
		} catch (ServiceException e) {
			e.getMessage();
		} catch (IOException e) {
			e.getMessage();
		}

	}

}
