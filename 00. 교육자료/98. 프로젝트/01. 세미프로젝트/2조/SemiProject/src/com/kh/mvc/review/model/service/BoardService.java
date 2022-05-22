package com.kh.mvc.review.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.review.model.dao.BoardDao;
import com.kh.mvc.review.model.vo.BoardList;

public class BoardService {
	private BoardDao dao = new BoardDao();
	
	// 여행후기 : 여행지 목록 조회
	public List<BoardList> getSpotList(String spotType) {
		List<BoardList> spotList = null;
		Connection connection = getConnection();
		
		spotList = dao.getSpotList(connection, spotType);
		
		close(connection);
		return spotList;
	}

	// 여행후기 : 숙박 목록 조회
	public List<BoardList> getStayList(String stayType) {
		List<BoardList> stayList = null;
		Connection connection = getConnection();
		
		stayList = dao.getStayList(connection, stayType);
		
		close(connection);
		return stayList;
		
	}

	// 여행후기 : 맛집 목록 조회
	public List<BoardList> getRestList(String restType) {
		List<BoardList> restList = null;
		Connection connection = getConnection();
		
		restList = dao.getRestList(connection, restType);
		
		close(connection);
		return restList;
	}
	


}

