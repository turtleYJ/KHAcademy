package com.kh.mvc.stay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.stay.model.service.StayDetailService;
import com.kh.mvc.stay.model.vo.StayDetailVo;


@WebServlet("/stay/stayDetail")
public class StayDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private StayDetailService service = new StayDetailService();

    public StayDetailServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("NO : " + no);
		 	
		StayDetailVo detailVo = service.findByNo(no);
		
		System.out.println(detailVo);
		
		request.setAttribute("detailVo", detailVo);		
    	request.getRequestDispatcher("/views/stay/stayDetail.jsp").forward(request, response);
	}

}
