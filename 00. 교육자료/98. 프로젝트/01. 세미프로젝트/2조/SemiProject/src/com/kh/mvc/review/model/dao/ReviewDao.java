package com.kh.mvc.review.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.review.model.vo.Comment;
import com.kh.mvc.review.model.vo.Review;

public class ReviewDao {
	public Review findReviewByNo(Connection connection, int no) {
		Review review = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"RV_NO, "
				+	"RV_TYPE, "
				+   "RV_TITLE, "
				+   "RV_DATE, "
				+   "RV_CONTENT, "
				+	"RV_IMG_PATH, "
				+   "RV_HITS, "
				+   "MEM_NM, "
				+   "MEM_NO "
				+ "FROM TB_REVIEW R "
				+ "JOIN TB_MEM M "
				+ "ON R.MEM_NO = M.NO "
				+ "WHERE RV_NO = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				review = new Review();
				
				review.setRv_no(rs.getInt("RV_NO"));
				review.setRv_type(rs.getString("RV_TYPE"));
				review.setRv_title(rs.getString("RV_TITLE"));
				review.setRv_date(rs.getDate("RV_DATE"));
				review.setRv_content(rs.getString("RV_CONTENT"));
				review.setRv_img_path(rs.getString("RV_IMG_PATH"));
				review.setRv_hits(rs.getInt("RV_HITS"));
				review.setMem_nm(rs.getString("MEM_NM"));
				review.setMem_no(rs.getInt("MEM_NO"));
				review.setRv_comments(this.getCommentsByNo(connection, no));

				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return review;
	}

	public int updateReadCount(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE TB_REVIEW SET RV_HITS=? WHERE RV_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			review.setRv_hits(review.getRv_hits() + 1);
			
			pstmt.setInt(1, review.getRv_hits());
			pstmt.setInt(2, review.getRv_no());
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}
	
	// 게시글 수정
	public int updateReview(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE TB_REVIEW SET TITLE=?,CONTENT=? WHERE RV_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getRv_title());
			pstmt.setString(2, review.getRv_content());
			pstmt.setInt(3, review.getRv_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 게시글 등록
	public int insertBoard(Connection connection, Review review) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TB_REVIEW(RV_NO, RV_TYPE, RV_TITLE, RV_DATE, RV_CONTENT, RV_HITS, MEM_NO) "
						+ "VALUES(SEQ_TB_REVIEW_NO.NEXTVAL,?,?,DEFAULT,?,DEFAULT,?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, review.getRv_type());
			pstmt.setString(2, review.getRv_title());
			pstmt.setString(3, review.getRv_content());
			pstmt.setInt(4, review.getMem_no());
			
			System.out.println(result);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public List<Comment> getCommentsByNo(Connection connection, int rv_no) {
		List<Comment> rv_comments = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		try {
			query = 
				  "SELECT CM_NO, RV_NO, CM_CONTENT, MEM_NO, MEM_NM, CM_DATE "
				+ "FROM TB_COMMENT C "
				+ "JOIN TB_MEM M ON(C.MEM_NO = M.NO) "
				+ "WHERE RV_NO=? "
				+ "ORDER BY CM_NO DESC";
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, rv_no);
			
			rs = pstmt.executeQuery();
			

			
			while(rs.next()) {
				Comment comment = new Comment();
				
				comment.setCm_no(rs.getInt("CM_NO"));
				comment.setRv_no(rs.getInt("RV_NO"));
				comment.setCm_content(rs.getString("CM_CONTENT"));
				comment.setMem_nm(rs.getString("MEM_NM"));
				comment.setCm_date(rs.getDate("CM_DATE"));
				
				rv_comments.add(comment);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return rv_comments;
	}
	
	public int insertComment(Connection connection, Comment comment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TB_COMMENT(CM_NO, RV_NO, CM_CONTENT, MEM_NO, CM_DATE) VALUES(SEQ_TB_COMMENT_NO.NEXTVAL,?, ?, ?,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, comment.getRv_no());
			pstmt.setString(2, comment.getCm_content());
			pstmt.setInt(3, comment.getMem_no());
			
			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
}
