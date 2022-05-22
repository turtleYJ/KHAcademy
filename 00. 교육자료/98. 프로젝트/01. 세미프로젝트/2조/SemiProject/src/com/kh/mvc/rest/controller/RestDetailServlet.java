package com.kh.mvc.rest.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.rest.model.service.RestDetailService;
import com.kh.mvc.rest.model.vo.RestDetailVo;


@WebServlet("/rest/restDetail")
public class RestDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	// 1. service 클래스 및 객체 생성
	private RestDetailService service = new RestDetailService();

    public RestDetailServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		/* 2. 
		 *   1) 사용자로부터 받은 no(파란글)값을 request.getParameter() 메소드로 받음
		 *   2) 
		 */    	
    	int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("NO : " + no);
		
		RestDetailVo detailVo = service.findByNo(no);
    	
		System.out.println(detailVo);
    	
		request.setAttribute("detailVo", detailVo);
    	request.getRequestDispatcher("/views/rest/restDetail.jsp").forward(request, response);
	}

}
