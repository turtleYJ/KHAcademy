package com.kh.mvc.stay.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.stay.model.service.BoardService;
import com.kh.mvc.stay.model.vo.BoardList;

@WebServlet("/stay/stayList")
public class StayListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
     
    public StayListServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String hotelType = "호텔";
    	String airbnbType = "에어비엔비";
    	String pensionType = "펜션";
    	String campingType = "캠핑";

    	List<BoardList> hotelList = null;
    	List<BoardList> airbnbList = null;
    	List<BoardList> pensionList = null;
    	List<BoardList> campingList = null;
    	
    	hotelList = service.getHotelList(hotelType);
    	airbnbList = service.getAirbnbList(airbnbType);
    	pensionList = service.getPensionList(pensionType);
    	campingList = service.getCampingList(campingType);
		
    	request.setAttribute("hotelList", hotelList);
    	request.setAttribute("airbnbList", airbnbList);
    	request.setAttribute("pensionList", pensionList);
    	request.setAttribute("campingList", campingList);
    	
    	request.getRequestDispatcher("/views/stay/stayList.jsp").forward(request, response);
	}

}
