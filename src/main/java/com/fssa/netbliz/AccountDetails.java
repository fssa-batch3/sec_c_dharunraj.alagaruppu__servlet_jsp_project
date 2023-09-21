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
import com.fssa.netbliz.model.Account;
import com.fssa.netbliz.service.AccountService;

/**
 * Servlet implementation class HomeAccountDetails
 */
@WebServlet("/AccountDetails")
public class AccountDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AccountService accountService = new AccountService();

		HttpSession session = request.getSession(false);

		long phone = (long) session.getAttribute("phoneNumber");

		List<Account> list = null;

		try {
			list = accountService.getAccountByPhoneNumber(phone);
			if (list != null && !list.isEmpty()) {

				session.setAttribute("accountList", list);

			} else {
				session.setAttribute("accountList", null);
			}
		} catch (ServiceException e) {
			e.getMessage();
		}

		session.setAttribute("phoneNumber", phone);
		request.setAttribute("successMsg", "Account added successfully");
		response.sendRedirect("./home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
