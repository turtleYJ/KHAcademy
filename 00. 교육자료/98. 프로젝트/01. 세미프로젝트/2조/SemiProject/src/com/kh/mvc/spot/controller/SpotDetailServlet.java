package com.kh.mvc.spot.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.spot.model.service.SpotDetailService;
import com.kh.mvc.spot.model.vo.SpotDetailVo;


@WebServlet("/spot/spotDetail")
public class SpotDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private SpotDetailService service = new SpotDetailService();

    public SpotDetailServlet() {
       
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 사용자가 준 no값(파란글)을 숫자로 읽어오기 -> 변수 no(갈색글)에 저장
		int no = Integer.parseInt(request.getParameter("no"));
		
		System.out.println("NO : " + no);
		 
		// Ctr+1로 SpotDetailService(서비스)에 findByNo() 메소드 생성 하고 처리하여 리턴되는 값을
    	// SpotDetailVo(VO) 클래스인 변수 detailVo에 저장		
		SpotDetailVo detailVo = service.findByNo(no);
		
		System.out.println(detailVo);
		
		// request객체에 저장(jsp에 사용할 수 있도록)
		request.setAttribute("detailVo", detailVo);		
		request.getRequestDispatcher("/views/spot/spotDetail.jsp").forward(request, response);
	}

}
