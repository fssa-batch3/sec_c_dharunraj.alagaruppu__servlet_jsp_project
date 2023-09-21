package com.fssa.netbliz;

import java.io.IOException;
import java.util.List;

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
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		CustomerService cusService = new CustomerService();

		List<Customer> cusDetail = null;

		try {
			if (cusService.logInCustomer(phone, email, password)) {

				HttpSession session = request.getSession();

		 		cusDetail = cusService.getCustomerByPhoneNumber(phone);

				session.setAttribute("customerDetails", cusDetail);

				session.setAttribute("phoneNumber", phone);

				response.sendRedirect("./AccountDetails");

			}
		} catch (ServiceException e) {

			e.getMessage();
		} catch (IOException e) {
			e.getMessage();
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
