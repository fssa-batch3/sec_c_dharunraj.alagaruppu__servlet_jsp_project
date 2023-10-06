package com.fssa.netbliz;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Customer;
import com.fssa.netbliz.service.CustomerService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long phone = Long.parseLong(request.getParameter("phone"));
		String password = request.getParameter("password");

		CustomerService cusService = new CustomerService();

		Customer customer = new Customer();

		try {
			if (cusService.logInCustomer(phone, password)) {

				HttpSession session = request.getSession();
				
				customer = cusService.getCustomerByPhoneNumber(phone);

				session.setAttribute("customerDetails", customer);

				session.setAttribute("phoneNumber", phone);

				System.out.println("Customer Logged in successfully");

				RequestDispatcher rd = request.getRequestDispatcher("./AccountDetails");
				rd.forward(request, response);

			}
		} catch (ServiceException | IOException | ServletException e) {

			System.out.println(phone);
			request.setAttribute("phoneNumber", phone);
			request.setAttribute("password", password);
			
			request.setAttribute("errorMsg", e.getMessage());
			request.setAttribute("path", "./login.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("./login.jsp");
			rd.forward(request, response);

			System.out.println("Login failed");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
