package com.fssa.netbliz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.Customer;
import com.fssa.netbliz.model.Transaction;
import com.fssa.netbliz.service.TransactionService;

/**
 * Servlet implementation class History
 */
@WebServlet("/History")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public History() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);

		TransactionService service = new TransactionService();

		Customer cus = (Customer) session.getAttribute("customerDetails");
		
		System.out.println("cus is" +cus.getCustomerId() + "cus id");

		List<Transaction> list = new ArrayList<>();
		System.out.println(cus.getCustomerId());
		try {
			list = service.listOfTransaction(cus.getCustomerId());
			JSONArray accountsJSonArray = new JSONArray(list);
			out.println(accountsJSonArray.toString());
			out.flush();

		} catch (ServiceException e) {
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
