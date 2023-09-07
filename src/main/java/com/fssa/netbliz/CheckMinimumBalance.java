package com.fssa.netbliz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Transaction;
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
		
		String makeTrans=(String) request.getAttribute("makeTrans");

		request.setAttribute("transaction", (Transaction)request.getAttribute("transaction"));
		System.out.println((Transaction)request.getAttribute("transaction")+"dfgvunh");
		RequestDispatcher dis = request.getRequestDispatcher("./MakeTransaction");
		dis.forward(request, response);
	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();


		String holder = request.getParameter("holder");
		String remittance = request.getParameter("remittance");
		String ifsc = request.getParameter("ifsc");
		double amount = Double.parseDouble(request.getParameter("amount"));
		String remark = request.getParameter("textAreaExample6");

		Transaction transaction= new Transaction();
		transaction.setAccountHolderAccNo(holder);
		transaction.setRemittanceAccNo(remittance);
		transaction.setReceiverIfscCode(ifsc);
		transaction.setTransferAmount(amount);
		transaction.setRemark(remark);
		TransactionService service = new TransactionService();
		
		request.setAttribute("transaction", transaction);
		try {
			if (service.checkMinimumBalance(holder, amount)) {
				
				RequestDispatcher dis = request.getRequestDispatcher("./MakeTransaction");
				dis.forward(request, response);

			} else {
				
				request.setAttribute("confirmMsg", "true");
				RequestDispatcher dis = request.getRequestDispatcher("./transfer.jsp");
				dis.forward(request, response);

			}
		} catch (ServiceException e) {
			e.getMessage();
		} catch (IOException e) {
			e.getMessage();
		}
	}
}
