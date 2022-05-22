package com.kh.mvc.home.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;
import com.kh.mvc.home.model.vo.RestBoardList;
import com.kh.mvc.home.model.vo.SpotBoardList;
import com.kh.mvc.home.model.vo.StayBoardList;

public class HomeDao {

	public List<RestBoardList> findRestList(Connection connection) {
		List<RestBoardList> restList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT RS_NO, RS_NAME, RS_IMG_PATH, RS_CONTENT "
				+ "FROM TB_REST";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RestBoardList restListData = new RestBoardList();
				
				restListData.setNo(rs.getInt("RS_NO"));
				restListData.setName(rs.getString("RS_NAME"));
				restListData.setImgPath(rs.getString("RS_IMG_PATH"));
				restListData.setContent(rs.getString("RS_CONTENT"));
				
				restList.add(restListData);
				
				System.out.println(restListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return restList;
	}

	public List<SpotBoardList> findSpotList(Connection connection) {
		List<SpotBoardList> spotList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT SP_NO, SP_TITLE, SP_TYPE, SP_IMG_PATH, SP_CONTENT "
				+ "FROM TB_SPOT";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SpotBoardList spotListData = new SpotBoardList();
				
				spotListData.setNo(rs.getInt("SP_NO"));
				spotListData.setTitle(rs.getString("SP_TITLE"));
				spotListData.setType(rs.getString("SP_TYPE"));
				spotListData.setImgPath(rs.getString("SP_IMG_PATH"));
				spotListData.setContent(rs.getString("SP_CONTENT"));
				
				spotList.add(spotListData);
				
				System.out.println(spotListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}				
		
		return spotList;
	}

	public List<StayBoardList> findStayList(Connection connection) {
		List<StayBoardList> stayList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT ST_NO, ST_NAME, ST_IMG_PATH, ST_CONTENT "
				+ "FROM TB_STAY";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StayBoardList stayListData = new StayBoardList();
				
				stayListData.setNo(rs.getInt("ST_NO"));
				stayListData.setName(rs.getString("ST_NAME"));
				stayListData.setImgPath(rs.getString("ST_IMG_PATH"));
				stayListData.setContent(rs.getString("ST_CONTENT"));
				
				stayList.add(stayListData);
				
				System.out.println(stayListData);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}				
		
		return stayList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
