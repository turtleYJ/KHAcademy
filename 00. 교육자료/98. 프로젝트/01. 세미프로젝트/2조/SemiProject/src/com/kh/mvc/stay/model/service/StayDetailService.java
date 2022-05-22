package com.kh.mvc.stay.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mvc.stay.model.dao.StayDetailDao;
import com.kh.mvc.stay.model.vo.StayDetailVo;


public class StayDetailService {

	private StayDetailDao dao = new StayDetailDao();
	
	public StayDetailVo findByNo(int no) {

		StayDetailVo detailVo = null;
		Connection connection = getConnection();
		
		detailVo = dao.findByNo(connection, no);
		
		close(connection);
		
		return detailVo;
	}

}
