package com.kh.mvc.review.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.review.model.vo.BoardList;

public class BoardDao {

	// 여행후기 : 여행지 목록 조회
	public List<BoardList> getSpotList(Connection connection, String spotType) {
		List<BoardList> spotList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_CONTENT "
				+ "FROM TB_REVIEW "
				+ "WHERE RV_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, spotType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList spotListData = new BoardList();
				spotListData.setNo(rs.getInt("RV_NO"));
				spotListData.setType(rs.getString("RV_TYPE"));
				spotListData.setTitle(rs.getString("RV_TITLE"));
				spotListData.setImgPath(rs.getString("RV_IMG_PATH"));
				spotListData.setContent(rs.getString("RV_CONTENT"));
				spotList.add(spotListData);
				
				// System.out.println(spotListData); // 리스트 조회 확인
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return spotList;
	}

	// 여행후기 : 숙박 목록 조회
	public List<BoardList> getStayList(Connection connection, String stayType) {
		List<BoardList> stayList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_CONTENT "
				+ "FROM TB_REVIEW "
				+ "WHERE RV_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, stayType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList stayListData = new BoardList();
				stayListData.setNo(rs.getInt("RV_NO"));
				stayListData.setType(rs.getString("RV_TYPE"));
				stayListData.setTitle(rs.getString("RV_TITLE"));
				stayListData.setImgPath(rs.getString("RV_IMG_PATH"));
				stayListData.setContent(rs.getString("RV_CONTENT"));
				stayList.add(stayListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return stayList;
	}
	
	// 여행후기 : 맛집 목록 조회
	public List<BoardList> getRestList(Connection connection, String restType) {
		List<BoardList> restList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RV_NO, RV_TYPE, RV_TITLE, RV_IMG_PATH, RV_CONTENT "
				+ "FROM TB_REVIEW "
				+ "WHERE RV_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, restType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList restListData = new BoardList();
				restListData.setNo(rs.getInt("RV_NO"));
				restListData.setType(rs.getString("RV_TYPE"));
				restListData.setTitle(rs.getString("RV_TITLE"));
				restListData.setImgPath(rs.getString("RV_IMG_PATH"));
				restListData.setContent(rs.getString("RV_CONTENT"));
				restList.add(restListData);
				
				// System.out.println(restListData); // 리스트 조회 확인
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return restList;
	}
	
}













