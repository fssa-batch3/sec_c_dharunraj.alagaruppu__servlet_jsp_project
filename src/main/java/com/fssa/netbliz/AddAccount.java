package com.fssa.netbliz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Account;
import com.fssa.netbliz.model.Customer;
import com.fssa.netbliz.service.AccountService;

/**
 * Servlet implementation class Home
 */
@WebServlet("/AddAccount")
public class AddAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAccount() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false); // false

		List<Customer> cus = (List<Customer>) session.getAttribute("customerDetails");

		String accNo = request.getParameter("accountnumber");
		
		String ifsc = request.getParameter("ifsc");

		long phone = (long) session.getAttribute("phoneNumber");

		System.out.println(phone);
		Account account = new Account(accNo, ifsc, phone); 

		AccountService accountService = new AccountService();

		try {
			if (accountService.getBankDetails(account)){

				session.setAttribute("phoneNumber",phone);
				session.setAttribute("customerDetails", cus);
				response.sendRedirect("AccountDetails");
				
			}
		} catch (ServiceException e) {

			e.getMessage();
		}

	}

}
