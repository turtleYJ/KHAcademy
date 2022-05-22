package com.kh.mvc.spot.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mvc.spot.model.dao.SpotDetailDao;
import com.kh.mvc.spot.model.vo.SpotDetailVo;


public class SpotDetailService {

	private SpotDetailDao dao = new SpotDetailDao();		

	public SpotDetailVo findByNo(int no) {
		
		SpotDetailVo detailVo = null;
		Connection connection = getConnection();
		
		detailVo = dao.findByNo(connection, no);
		
		close(connection);
		
		return detailVo;
	}
	
	
	

}
