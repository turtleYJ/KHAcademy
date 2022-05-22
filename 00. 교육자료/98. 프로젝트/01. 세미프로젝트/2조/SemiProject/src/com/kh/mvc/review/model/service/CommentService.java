package com.kh.mvc.review.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mvc.review.model.dao.ReviewDao;
import com.kh.mvc.review.model.vo.Comment;

public class CommentService {
	
	private ReviewDao dao = new ReviewDao();

	public int saveComment(Comment comment) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.insertComment(connection, comment);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}



}
