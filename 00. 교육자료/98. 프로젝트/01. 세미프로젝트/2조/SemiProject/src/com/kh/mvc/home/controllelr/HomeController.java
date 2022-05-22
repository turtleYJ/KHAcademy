package com.kh.mvc.home.controllelr;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.home.model.service.HomeService;
import com.kh.mvc.home.model.vo.RestBoardList;
import com.kh.mvc.home.model.vo.SpotBoardList;
import com.kh.mvc.home.model.vo.StayBoardList;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HomeService service = new HomeService();
       
    public HomeController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RestBoardList> restList = null;
    	List<SpotBoardList> spotList = null;
    	List<StayBoardList> stayList = null;
    	
    	restList = service.getRestList();
    	spotList = service.getSpotList();
    	stayList = service.getStayList();
    	
    	request.setAttribute("restList", restList);
    	request.setAttribute("spotList", spotList);
    	request.setAttribute("stayList", stayList);
    	
    	request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
