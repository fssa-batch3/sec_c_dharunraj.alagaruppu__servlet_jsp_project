package com.fssa.netbliz;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String holder = request.getParameter("holder");
		String remittance = request.getParameter("remittance");
		String ifsc = request.getParameter("ifsc");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String remark = request.getParameter("textAreaExample6");

		System.out.println(holder);
		System.out.println(remittance);
		System.out.println(ifsc);
		System.out.println(amount);
		System.out.println(remark);

		Transaction trans = new Transaction(holder, remittance, ifsc, amount, remark);

		TransactionService transService = new TransactionService();

		try {
			if (transService.moneyTransaction(trans))

				response.sendRedirect("History");
		} catch (ServiceException e) {
			e.getMessage();
		} catch (IOException e) {
			e.getMessage();
		}

	}

}
