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
import com.fssa.netbliz.model.Transaction;
import com.fssa.netbliz.service.AccountService;
import com.fssa.netbliz.service.TransactionService;

/**
 * Servlet implementation class CheckMinimumBalance
 */
@WebServlet("/CheckMinimumBalance")
public class CheckMinimumBalance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckMinimumBalance() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		String holder = request.getParameter("holder");
		String remittance = request.getParameter("remittance");
		String ifsc = request.getParameter("ifsc");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String remark = request.getParameter("textAreaExample6");

		Transaction trans = new Transaction(holder, remittance, ifsc, amount, remark);

		TransactionService service = new TransactionService();
		AccountService accountService = new AccountService();
		Account acc = new Account();

		try {
			if (service.holderConditions(holder, amount) && service.remittanceConditions(remittance, ifsc)) {

				session.setAttribute("transaction", trans);
				session.setAttribute("transactionRetrieve", trans);
				if (service.checkMinimumBalance(holder, amount)) {
					response.sendRedirect("./MakeTransaction");
				} else {
					acc = accountService.getAccountByNumber(holder);

					request.setAttribute("min", acc.getMinimumBalance());
					request.setAttribute("balance", acc.getAvailableBalance());
					request.setAttribute("confirmMsg", "true");
					RequestDispatcher dis = request.getRequestDispatcher("./transfer.jsp");
					dis.forward(request, response);
				}
			}
			
		} catch (ServiceException | IOException e) {
			session.setAttribute("transactionRetrieve", trans);
			request.setAttribute("errorMsg", e.getMessage());
			request.setAttribute("path", "./transfer.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("./transfer.jsp");
			rd.forward(request, response);
		}
	}
}
