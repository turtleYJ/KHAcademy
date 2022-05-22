package com.kh.mvc.home.model.service;

import java.sql.Connection;
import java.util.List;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import com.kh.mvc.home.model.dao.HomeDao;
import com.kh.mvc.home.model.vo.RestBoardList;
import com.kh.mvc.home.model.vo.SpotBoardList;
import com.kh.mvc.home.model.vo.StayBoardList;

public class HomeService {
	private HomeDao dao = new HomeDao();

	public List<RestBoardList> getRestList() {
		List<RestBoardList> restList = null;
		Connection connection = getConnection();
		
		restList = dao.findRestList(connection);
		
		close(connection);
		return restList;
	}

	public List<SpotBoardList> getSpotList() {
		List<SpotBoardList> spotList = null;
		Connection connection = getConnection();
		
		spotList = dao.findSpotList(connection);
		
		close(connection);
		return spotList;
	}

	public List<StayBoardList> getStayList() {
		List<StayBoardList> stayList = null;
		Connection connection = getConnection();
		
		stayList = dao.findStayList(connection);
		
		close(connection);
		return stayList;
	}

}
