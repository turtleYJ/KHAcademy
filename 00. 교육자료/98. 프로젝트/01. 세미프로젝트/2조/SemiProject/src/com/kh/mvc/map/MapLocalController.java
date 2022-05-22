package com.kh.mvc.map;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.home.model.vo.RestBoardList;
import com.kh.mvc.home.model.vo.SpotBoardList;
import com.kh.mvc.home.model.vo.StayBoardList;
import com.kh.mvc.map.model.service.MapService;

@WebServlet("/local.do")
public class MapLocalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MapService service = new MapService();
       
    public MapLocalController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int localNo = Integer.parseInt(request.getParameter("no")); 
		String localName = request.getParameter("name");
		
		System.out.println(localNo);
		System.out.println(localName);
		
		List<RestBoardList> restList = null;
    	List<SpotBoardList> spotList = null;
    	List<StayBoardList> stayList = null;
    	
    	restList = service.getRestList(localNo);
    	spotList = service.getSpotList(localNo);
    	stayList = service.getStayList(localNo);
    	
    	request.setAttribute("restList", restList);
    	request.setAttribute("spotList", spotList);
    	request.setAttribute("stayList", stayList);
    	request.setAttribute("localName", localName);
    	
    	request.getRequestDispatcher("/views/map/mapLocal.jsp").forward(request, response);
		
		
		
	}


}
