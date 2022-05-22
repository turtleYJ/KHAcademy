package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet("/member/searchPWD")
public class SearchPWDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
       
    public SearchPWDServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/member/searchPWD.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		Member member = service.findMemberPWD(userId, userName, phone);
		
		if(member != null) {
			request.setAttribute("msg", "비밀번호는 " + member.getPassword() + "입니다.");
			request.setAttribute("location", "/home");
			
		} else {
			request.setAttribute("msg", "입력 정보를 확인해주세요.");
			request.setAttribute("location", "/home");
			
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}
