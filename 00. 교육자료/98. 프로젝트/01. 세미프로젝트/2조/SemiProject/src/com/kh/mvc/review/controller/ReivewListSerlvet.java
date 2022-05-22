package com.kh.mvc.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.review.model.service.BoardService;
import com.kh.mvc.review.model.vo.BoardList;

@WebServlet("/review/reviewList")
public class ReivewListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
  
    public ReivewListSerlvet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String spotType = "여행지";
    	String stayType = "숙박";
    	String restType = "맛집";


    	List<BoardList> spotList = null;
    	List<BoardList> stayList = null;
    	List<BoardList> restList = null;
    	
    	spotList = service.getSpotList(spotType);
    	stayList = service.getStayList(stayType);
    	restList = service.getRestList(restType);
		
    	request.setAttribute("spotList", spotList);
    	request.setAttribute("stayList", stayList);
    	request.setAttribute("restList", restList);
    	
    	request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response);
	}

}
