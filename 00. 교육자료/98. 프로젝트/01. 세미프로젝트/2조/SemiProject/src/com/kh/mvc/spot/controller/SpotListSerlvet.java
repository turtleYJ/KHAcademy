package com.kh.mvc.spot.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.spot.model.service.BoardService;
import com.kh.mvc.spot.model.vo.BoardList;
	

@WebServlet("/spot/spotList")
public class SpotListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
	
    public SpotListSerlvet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String spotType = "관광명소";
    	String expirenceType = "체험";
    	String shoppingType = "쇼핑";

    	List<BoardList> spotList = null;
    	List<BoardList> experienceList = null;
    	List<BoardList> shoppingList = null;
    	
    	spotList = service.getSpotList(spotType);
    	experienceList = service.getExperienceList(expirenceType);
    	shoppingList = service.getShoppingList(shoppingType);
		
    	request.setAttribute("spotList", spotList);
    	request.setAttribute("experienceList", experienceList);
    	request.setAttribute("shoppingList", shoppingList);
    	
    	request.getRequestDispatcher("/views/spot/spotList.jsp").forward(request, response);
	}
    
    

}
