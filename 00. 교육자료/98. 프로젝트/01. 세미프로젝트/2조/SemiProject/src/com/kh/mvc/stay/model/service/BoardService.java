package com.kh.mvc.stay.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.stay.model.dao.BoardDao;
import com.kh.mvc.stay.model.vo.BoardList;

public class BoardService {
	private BoardDao dao = new BoardDao();
	
	// 숙박 : 호텔 목록 조회
	public List<BoardList> getHotelList(String hotelType) {
		List<BoardList> hotelList = null;
		Connection connection = getConnection();
		
		hotelList = dao.findHotelList(connection, hotelType);
		
		close(connection);
		return hotelList;
	}

	// 숙박 : 에어비엔비 목록 조회
	public List<BoardList> getAirbnbList(String airbnbType) {
		List<BoardList> airbnbList = null;
		Connection connection = getConnection();
		
		airbnbList = dao.findAirbnbList(connection, airbnbType);
		
		close(connection);
		return airbnbList;
	}

	// 숙박 : 펜션 목록 조회
	public List<BoardList> getPensionList(String pensionType) {
		List<BoardList> pensionList = null;
		Connection connection = getConnection();
		
		pensionList = dao.findPensionList(connection, pensionType);
		
		close(connection);
		return pensionList;
	}

	// 숙박 : 캠핑 목록 조회
	public List<BoardList> getCampingList(String campingType) {
		List<BoardList> campingList = null;
		Connection connection = getConnection();
		
		campingList = dao.findCampingList(connection, campingType);
		
		close(connection);
		return campingList;
	}
	
}
