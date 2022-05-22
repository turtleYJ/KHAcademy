package com.kh.mvc.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.vo.Member;
import com.kh.mvc.review.model.service.CommentService;
import com.kh.mvc.review.model.vo.Comment;

@WebServlet("/review/comment")
public class ReviewCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CommentService service = new CommentService();

    public ReviewCommentServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		int rv_no = Integer.parseInt(request.getParameter("rv_no"));
		String cm_content = request.getParameter("cm_content");
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;

    	if(loginMember != null) {
			Comment comment = new Comment();
			
			comment.setRv_no(rv_no);
			comment.setMem_no(loginMember.getNo());
			comment.setMem_nm(loginMember.getName());
			comment.setCm_content(cm_content);
			
			int result = service.saveComment(comment);
			
			if(result > 0) {
         		request.setAttribute("msg", "댓글 등록 성공!");
         		request.setAttribute("location", "/review/reviewDetail?rv_no=" + rv_no);
			} else {
				request.setAttribute("msg", "댓글 등록 실패!");
         		request.setAttribute("location", "/review/reviewDetail?rv_no=" + rv_no);
			}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/member/login");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   	}
}
