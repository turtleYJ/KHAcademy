package com.kh.mvc.stay.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.stay.model.vo.StayDetailVo;

public class StayDetailDao {

	public StayDetailVo findByNo(Connection connection, int no) {
		
		StayDetailVo detailVo = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"ST_NO, "
				+ 	"ST_TYPE, "
				+ 	"ST_NAME, "
				+ 	"ST_IMG_PATH, "
				+ 	"ST_ADDR, "
				+ 	"ST_PHONE, "
				+ 	"ST_PRICE, "
				+ 	"ST_CONTENT, "
				+ 	"ST_LAT, "
				+ 	"ST_LONG "
				+ "FROM TB_STAY "
				+ "WHERE ST_NO=?"; 
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				detailVo = new StayDetailVo();
				
				detailVo.setNo(rs.getInt("ST_NO"));
				detailVo.setType(rs.getString("ST_TYPE"));
				detailVo.setName(rs.getString("ST_NAME"));
				detailVo.setImgPath(rs.getString("ST_IMG_PATH"));
				detailVo.setAddr(rs.getString("ST_ADDR"));
				detailVo.setPhone(rs.getString("ST_PHONE"));
				detailVo.setPrice(rs.getString("ST_PRICE"));
				detailVo.setContent(rs.getString("ST_CONTENT"));
				detailVo.setXlat(rs.getString("ST_LAT"));
				detailVo.setYlong(rs.getString("ST_LONG"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}	
		
		return detailVo;
	}

}
