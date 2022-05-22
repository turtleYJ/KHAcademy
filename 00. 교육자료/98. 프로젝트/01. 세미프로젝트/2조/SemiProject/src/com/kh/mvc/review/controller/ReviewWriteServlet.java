package com.kh.mvc.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.review.model.service.ReviewService;
import com.kh.mvc.review.model.vo.Review;


@WebServlet("/review/write")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReviewService service = new ReviewService();
	
    public ReviewWriteServlet() {
    }
    

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	String viewName = "/views/review/reviewWrite.jsp";
    	
    	if(loginMember == null) {    
    		viewName = "/views/common/msg.jsp";
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
    		request.setAttribute("location", "/member/login");
    	}
    	
    	request.getRequestDispatcher(viewName).forward(request, response);
	}

    
    // 파일 업로드 구현 X
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	request.setCharacterEncoding("UTF-8");
    	
    	// 폼 파라미터로 넘어온 값들(파일에 대한 정보 X)
    	String title = request.getParameter("title");
    	String type = request.getParameter("type");
    	String content = request.getParameter("content");
    	
    	// 로그인 안된 사용자가 게시글 작성이 불가능하도록 체크하는 로직
    	HttpSession session = request.getSession(false); 
    	Member loginMember = session != null ? (Member) session.getAttribute("loginMember") : null;
    	
    	if(loginMember != null) {    
    		Review review = new Review();
    		
    		review.setMem_no(loginMember.getNo());
    		review.setRv_type(type);
    		review.setRv_title(title);
    		review.setRv_content(content);
    		
    		result = service.save(review);
    		
    		if(result > 0) {
    			request.setAttribute("msg", "게시글 등록 성공");
    			request.setAttribute("location", "/review/reviewList");
        	} else {
    			request.setAttribute("msg", "게시글 등록 실패");
    			request.setAttribute("location", "/review/reviewList");
        	}
    	} else {
    		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
			request.setAttribute("location", "/");			
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

    }


}
