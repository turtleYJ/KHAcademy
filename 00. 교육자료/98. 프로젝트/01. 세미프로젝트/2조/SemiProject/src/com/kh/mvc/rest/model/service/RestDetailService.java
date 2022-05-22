package com.kh.mvc.rest.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mvc.rest.model.dao.RestDetailDao;
import com.kh.mvc.rest.model.vo.RestDetailVo;

public class RestDetailService {

	private RestDetailDao dao  =new RestDetailDao();
	
	public RestDetailVo findByNo(int no) {
		
		RestDetailVo detailVo = null;
		Connection connection = getConnection();
		
		detailVo = dao.findByNo(connection, no);
		
		close(connection);
		
		
		return detailVo;
	}

}
