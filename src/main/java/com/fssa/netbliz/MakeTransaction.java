package com.fssa.netbliz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Transaction;
import com.fssa.netbliz.service.TransactionService;

/**
 * Servlet implementation class MakeTransaction
 */
@WebServlet("/MakeTransaction")
public class MakeTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MakeTransaction() {
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
		Transaction trans = (Transaction) session.getAttribute("transaction");
		System.out.println("make");
		System.out.println("MK:" + trans);
		System.out.println("make");
		TransactionService transService = new TransactionService();

		try {
			if (transService.moneyTransaction(trans)) {

				session.removeAttribute("transaction");
				response.sendRedirect("./history.jsp");

			}
		} catch (ServiceException | IOException e) {

			System.out.println(e.getMessage());
		}

		//
	}

}
