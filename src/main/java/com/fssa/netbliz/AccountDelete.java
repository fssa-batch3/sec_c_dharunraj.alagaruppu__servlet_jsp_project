package com.fssa.netbliz;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.service.AccountService;

/**
 * Servlet implementation class AccountDelete
 */
@WebServlet("/AccountDelete")
public class AccountDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accNo = (String) request.getParameter("acc");

		AccountService accountService = new AccountService();

		try {
			if (accountService.removeAccountByAccountNumber(accNo)) {

				request.setAttribute("successMsg", "Your account details deleted successfully.");
				request.setAttribute("path", "./AccountDetails");

				RequestDispatcher rd = request.getRequestDispatcher("./home.jsp");
				rd.forward(request, response);

				System.out.println("Your account details successfully deleted ");

			}
		} catch (ServiceException | ServletException | IOException e) {
			
			request.setAttribute("errorMsg", e.getMessage());
			request.setAttribute("path", "./home.jsp");

			RequestDispatcher rd = request.getRequestDispatcher("./home.jsp");
			rd.forward(request, response);

			System.out.println("deleted failed");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
