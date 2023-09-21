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
import com.fssa.netbliz.model.Account;
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
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);

		TransactionService service = new TransactionService();

		List<Account> accList = new ArrayList<>();

		accList = (List<Account>) session.getAttribute("accountList"); // unchecked

		List<Transaction> list = new ArrayList<>();

		for (Account acc : accList) {

			System.out.println(acc);

			try {
				list = service.listOfTransaction(acc.getCustomerId());
				System.out.println(list);
				JSONArray accountsJSonArray = new JSONArray(list);
				out.println(accountsJSonArray.toString());
				out.flush();

			} catch (ServiceException e) {
				e.getMessage();
			}

		}
//
//		if (list != null && !list.isEmpty()) {
//
//			session.setAttribute("transList", list);
//			System.out.println("if");
//		}
		System.out.println("end");
		session.setAttribute("accountList", accList);

//		response.sendRedirect("./history.jsp");

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
