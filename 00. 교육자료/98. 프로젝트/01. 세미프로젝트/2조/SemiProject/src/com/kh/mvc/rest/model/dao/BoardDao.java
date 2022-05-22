package com.kh.mvc.rest.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.rest.model.vo.BoardList;

public class BoardDao {

	public List<BoardList> getRestList(Connection connection, String restType) {
		List<BoardList> restList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RS_NO, RS_TYPE, RS_NAME, RS_IMG_PATH, RS_CONTENT "
				+ "FROM TB_REST "
				+ "WHERE RS_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, restType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList restListData = new BoardList();
				restListData.setNo(rs.getInt("RS_NO"));
				restListData.setName(rs.getString("RS_NAME"));
				restListData.setType(rs.getString("RS_TYPE"));
				restListData.setImgPath(rs.getString("RS_IMG_PATH"));
				restListData.setContent(rs.getString("RS_CONTENT"));
				restList.add(restListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return restList;
	}

	public List<BoardList> getCafeList(Connection connection, String cafeType) {
		List<BoardList> cafeList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RS_NO, RS_TYPE, RS_NAME, RS_IMG_PATH, RS_CONTENT "
						+ "FROM TB_REST "
						+ "WHERE RS_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, cafeType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList cafeListData = new BoardList();
				cafeListData.setNo(rs.getInt("RS_NO"));
				cafeListData.setName(rs.getString("RS_NAME"));
				cafeListData.setType(rs.getString("RS_TYPE"));
				cafeListData.setImgPath(rs.getString("RS_IMG_PATH"));
				cafeListData.setContent(rs.getString("RS_CONTENT"));
				cafeList.add(cafeListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cafeList;
	}

	public List<BoardList> getBarList(Connection connection, String barType) {
		List<BoardList> barList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RS_NO, RS_TYPE, RS_NAME, RS_IMG_PATH, RS_CONTENT "
						+ "FROM TB_REST "
						+ "WHERE RS_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, barType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList barListData = new BoardList();
				barListData.setNo(rs.getInt("RS_NO"));
				barListData.setName(rs.getString("RS_NAME"));
				barListData.setType(rs.getString("RS_TYPE"));
				barListData.setImgPath(rs.getString("RS_IMG_PATH"));
				barListData.setContent(rs.getString("RS_CONTENT"));
				barList.add(barListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return barList;
	}
	
}











