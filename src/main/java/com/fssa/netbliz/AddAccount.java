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

		HttpSession session = request.getSession(false); // false

		String accNo = request.getParameter("accountnumber");

		String ifsc = request.getParameter("ifsc");

		long phone = (long) session.getAttribute("phoneNumber");

		Account account = new Account(accNo, ifsc, phone);

		AccountService accountService = new AccountService();

		session.setAttribute("retrieveAccountDetails", account);
		System.out.println("start");
		try {
			if (accountService.getBankDetails(account)) {

				request.setAttribute("successMsg",
						"Your account details successfully fetched from the bank.. You can see your bank details below that form.!");
				request.setAttribute("path", "./AccountDetails");

				RequestDispatcher rd = request.getRequestDispatcher("./home.jsp");
				rd.forward(request, response);

				session.removeAttribute("retrieveAccountDetails");

				System.out.println("Your account details successfully added ");
			}

		} catch (ServiceException | IOException e) {
			
			request.setAttribute("errorMsg", e.getMessage());
			request.setAttribute("path", "./home.jsp");

			RequestDispatcher rd = request.getRequestDispatcher("./home.jsp");
			rd.forward(request, response);

			System.out.println("added failed");
		}

	}

}
