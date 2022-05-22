package com.kh.mvc.map.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.mvc.home.model.dao.HomeDao;
import com.kh.mvc.home.model.vo.RestBoardList;
import com.kh.mvc.home.model.vo.SpotBoardList;
import com.kh.mvc.home.model.vo.StayBoardList;
import com.kh.mvc.map.model.dao.MapDao;

public class MapService {

	private MapDao dao = new MapDao();

	public List<RestBoardList> getRestList(int localNo) {
		List<RestBoardList> restList = null;
		Connection connection = getConnection();
		
		restList = dao.findRestList(connection, localNo);
		
		close(connection);
		return restList;
	}

	public List<SpotBoardList> getSpotList(int localNo) {
		List<SpotBoardList> spotList = null;
		Connection connection = getConnection();
		
		spotList = dao.findSpotList(connection, localNo);
		
		close(connection);
		return spotList;
	}

	public List<StayBoardList> getStayList(int localNo) {
		List<StayBoardList> stayList = null;
		Connection connection = getConnection();
		
		stayList = dao.findStayList(connection, localNo);
		
		close(connection);
		return stayList;
	}

}
