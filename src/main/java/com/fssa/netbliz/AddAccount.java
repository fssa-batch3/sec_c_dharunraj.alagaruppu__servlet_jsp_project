package com.fssa.netbliz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.netbliz.enums.AccountEnum;
import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Account;
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

		String accNo = request.getParameter("accountnumber");
		String ifsc = request.getParameter("ifsc");
		long phone = Long.parseLong(request.getParameter("phone"));
		AccountEnum type = AccountEnum.valueOf(request.getParameter("type"));
		double minimumBalance = Double.parseDouble(request.getParameter("min"));

		Account account = new Account(accNo, ifsc, phone, minimumBalance, type);

		AccountService accountService = new AccountService();

		try {
			if (accountService.addAccount(account)) {
				
				response.sendRedirect("AccountDetails");
			}
		} catch (ServiceException e) {

			e.printStackTrace();
		}

	}

}
