package com.kh.mvc.spot.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.spot.model.dao.BoardDao;
import com.kh.mvc.spot.model.vo.BoardList;

public class BoardService {
	private BoardDao dao = new BoardDao();

	// 여행지 : 관광명소 목록 조회
	public List<BoardList> getSpotList(String spotType) {
		List<BoardList> spotList = null;
		Connection connection = getConnection();
		
		spotList = dao.findSpotList(connection, spotType);
		
		close(connection);
		return spotList;
	}

	// 여행지 : 체험 목록 조회
	public List<BoardList> getExperienceList(String experienceType) {
		List<BoardList> experienceList = null;
		Connection connection = getConnection();
		
		experienceList = dao.findExperienceList(connection, experienceType);
		
		close(connection);
		return experienceList;
	}
	
	// 여행지 : 쇼핑 목록 조회
	public List<BoardList> getShoppingList(String shoppingType) {
		List<BoardList> shoppingList = null;
		Connection connection = getConnection();
		
		shoppingList = dao.findShoppingList(connection, shoppingType);
		
		close(connection);
		return shoppingList;
	}
}
