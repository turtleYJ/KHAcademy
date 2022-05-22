package com.kh.mvc.rest.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.rest.model.dao.BoardDao;
import com.kh.mvc.rest.model.vo.BoardList;

public class BoardService {
	private BoardDao dao = new BoardDao();
	
	// 맛집 : 음식점 목록 조회
	public List<BoardList> getRestList(String restType) {
		List<BoardList> restList = null;
		Connection connection = getConnection();
		
		restList = dao.getRestList(connection, restType);
		
		close(connection);
		return restList;
	}

	// 맛집 : 카페 목록 조회
	public List<BoardList> getCafeList(String cafeType) {
		List<BoardList> cafeList = null;
		Connection connection = getConnection();
		
		cafeList = dao.getCafeList(connection, cafeType);
		
		close(connection);
		return cafeList;
	}

	// 맛집 : 술집 목록 조회
	public List<BoardList> getBarList(String barType) {
		List<BoardList> barList = null;
		Connection connection = getConnection();
		
		barList = dao.getBarList(connection, barType);
		
		close(connection);
		return barList;
	}
	

}
