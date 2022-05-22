package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/member/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
       
    public SearchServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/member/searchID.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		Member member = service.findMemberID(userName, phone);
		
		if(member != null) {
			request.setAttribute("msg", "아이디는 " + member.getId() + "입니다.");
			request.setAttribute("location", "/home");
			
		} else {
			request.setAttribute("msg", "존재하는 아이디가 없습니다.");
			request.setAttribute("location", "/home");
			
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
