package com.kh.mvc.stay.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.mvc.stay.model.vo.BoardList;

public class BoardDao {
	// 숙박 : 호텔 목록 조회
	public List<BoardList> findHotelList(Connection connection, String hotelType) {
		List<BoardList> hotelList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT ST_NO, ST_NAME, ST_TYPE, ST_IMG_PATH, ST_CONTENT "
				+ "FROM TB_STAY "
				+ "WHERE ST_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, hotelType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList hotelListData = new BoardList();
				hotelListData.setNo(rs.getInt("ST_NO"));
				hotelListData.setName(rs.getString("ST_NAME"));
				hotelListData.setType(rs.getString("ST_TYPE"));
				hotelListData.setImgPath(rs.getString("ST_IMG_PATH"));
				hotelListData.setContent(rs.getString("ST_CONTENT"));
				hotelList.add(hotelListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return hotelList;
	}

	// 숙박 : 에어비엔비 목록 조회
	public List<BoardList> findAirbnbList(Connection connection, String airbnbType) {
		List<BoardList> airbnbList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT ST_NO, ST_NAME, ST_TYPE, ST_IMG_PATH, ST_CONTENT "
						+ "FROM TB_STAY "
						+ "WHERE ST_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, airbnbType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList airbnbListData = new BoardList();
				airbnbListData.setNo(rs.getInt("ST_NO"));
				airbnbListData.setName(rs.getString("ST_NAME"));
				airbnbListData.setType(rs.getString("ST_TYPE"));
				airbnbListData.setImgPath(rs.getString("ST_IMG_PATH"));
				airbnbListData.setContent(rs.getString("ST_CONTENT"));
				airbnbList.add(airbnbListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return airbnbList;
	}

	// 숙박 : 펜션 목록 조회
	public List<BoardList> findPensionList(Connection connection, String pensionType) {
		List<BoardList> pensionList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT ST_NO, ST_NAME, ST_TYPE, ST_IMG_PATH, ST_CONTENT "
						+ "FROM TB_STAY "
						+ "WHERE ST_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, pensionType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList pensionListData = new BoardList();
				pensionListData.setNo(rs.getInt("ST_NO"));
				pensionListData.setName(rs.getString("ST_NAME"));
				pensionListData.setType(rs.getString("ST_TYPE"));
				pensionListData.setImgPath(rs.getString("ST_IMG_PATH"));
				pensionListData.setContent(rs.getString("ST_CONTENT"));
				pensionList.add(pensionListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return pensionList;
	}

	// 숙박 : 캠핑 목록 조회
	public List<BoardList> findCampingList(Connection connection, String campingType) {
		List<BoardList> campingList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT ST_NO, ST_NAME, ST_TYPE, ST_IMG_PATH, ST_CONTENT "
						+ "FROM TB_STAY "
						+ "WHERE ST_TYPE=?";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, campingType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardList campingListData = new BoardList();
				campingListData.setNo(rs.getInt("ST_NO"));
				campingListData.setName(rs.getString("ST_NAME"));
				campingListData.setType(rs.getString("ST_TYPE"));
				campingListData.setImgPath(rs.getString("ST_IMG_PATH"));
				campingListData.setContent(rs.getString("ST_CONTENT"));
				campingList.add(campingListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return campingList;
	}
	
}











