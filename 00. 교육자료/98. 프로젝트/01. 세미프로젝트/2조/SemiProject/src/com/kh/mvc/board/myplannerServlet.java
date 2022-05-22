package com.kh.mvc.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/myPlanner")
public class myplannerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public myplannerServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/board/myplanner.jsp").forward(request, response);
	}

}
