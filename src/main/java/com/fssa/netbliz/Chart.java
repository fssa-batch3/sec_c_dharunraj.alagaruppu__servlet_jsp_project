package com.fssa.netbliz;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.netbliz.exception.ServiceException;
import com.fssa.netbliz.model.CronJob;
import com.fssa.netbliz.service.UpdateAverageBalanceJobSerivice;

/**
 * Servlet implementation class Chart
 */
public class Chart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Chart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String accoutNumber = request.getParameter("acc");
		System.out.println(accoutNumber);

		UpdateAverageBalanceJobSerivice service = new UpdateAverageBalanceJobSerivice();

		try {
			List<CronJob> list = null;

			list = service.getBankDetails(accoutNumber);
			if (list != null && !list.isEmpty()) {

				request.setAttribute("chart", list);
				request.setAttribute("selectedAccount", accoutNumber);

			} else {

				request.setAttribute("errorMsg", "The calculation of your account is start's with tommorow !!");
				request.setAttribute("path", "./home.jsp");
			}

		} catch (ServiceException e) {

			System.out.println("chart failed");
		}

		RequestDispatcher dis = request.getRequestDispatcher("./chart.jsp");
		dis.forward(request, response);

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
