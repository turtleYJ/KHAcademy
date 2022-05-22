package com.kh.mvc.review.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.review.model.dao.ReviewDao;
import com.kh.mvc.review.model.vo.Review;

public class ReviewService {
	
	private ReviewDao dao = new ReviewDao();

	
	public Review findReviewByNo(int no, boolean hasRead) {
		Review review = null;
		Connection connection = getConnection();
		
		review = dao.findReviewByNo(connection, no);
		
		// 게시글 조회수 증가
		if(review != null && !hasRead) {
			int result = dao.updateReadCount(connection, review);
			
			if(result > 0) {
				commit(connection);
			} else {
				rollback(connection);
			}
		}
		
		close(connection);		
		
		return review;
	}
	public int save(Review review) {
		int result = 0;
		Connection connection = getConnection();
		
		if (review.getRv_no() != 0 ) {
			result = dao.updateReview(connection, review);
		} else {
			result = dao.insertBoard(connection, review);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);		
		
		return result;
	}	
	


}
