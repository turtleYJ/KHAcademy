package com.kh.mvc.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.review.model.service.ReviewService;
import com.kh.mvc.review.model.vo.Review;

@WebServlet("/review/reviewDetail")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService service = new ReviewService();

	public ReviewDetailServlet() {
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int rv_no = Integer.parseInt(request.getParameter("rv_no"));

		boolean hasRead = false;
		Review review = service.findReviewByNo(rv_no, hasRead);
		
		System.out.println(review);

		request.setAttribute("review", review);
		request.getRequestDispatcher("/views/review/reviewDetail.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
