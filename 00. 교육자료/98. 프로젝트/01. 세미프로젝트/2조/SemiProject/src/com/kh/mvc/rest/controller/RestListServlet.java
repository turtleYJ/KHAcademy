package com.kh.mvc.rest.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.rest.model.service.BoardService;
import com.kh.mvc.rest.model.vo.BoardList;

@WebServlet("/rest/restList")
public class RestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private BoardService service = new BoardService();
	
    public RestListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String restType = "음식점";
    	String cafeType = "카페";
    	String barType = "술집";

    	List<BoardList> restList = null;
    	List<BoardList> cafeList = null;
    	List<BoardList> barList = null;
    	
    	restList = service.getRestList(restType);
    	cafeList = service.getCafeList(cafeType);
    	barList = service.getBarList(barType);
		
    	request.setAttribute("restList", restList);
    	request.setAttribute("cafeList", cafeList);
    	request.setAttribute("barList", barList);
    	
    	request.getRequestDispatcher("/views/rest/restList.jsp").forward(request, response);
	}

}
