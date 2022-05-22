package com.kh.mvc.spot.model.dao;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.mvc.spot.model.vo.SpotDetailVo;

public class SpotDetailDao {

	public SpotDetailVo findByNo(Connection connection, int no) {
		
		SpotDetailVo detailVo = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = 
				"SELECT "
				+ 	"SP_NO, "
				+ 	"SP_TITLE, "
				+ 	"SP_TYPE, "
				+ 	"SP_IMG_PATH, "
				+ 	"SP_ADDR, "
				+ 	"SP_PHONE, "
				+ 	"SP_PRICE, "
				+ 	"SP_OFFDAY, "
				+ 	"SP_CONTENT, "
				+ 	"SP_LAT, "
				+ 	"SP_LONG "
				+ "FROM TB_SPOT "
				+ "WHERE SP_NO=?";		
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				detailVo = new SpotDetailVo();
				
				detailVo.setNo(rs.getInt("SP_NO"));
				detailVo.setTitle(rs.getString("SP_TITLE"));
				detailVo.setType(rs.getString("SP_TYPE"));
				detailVo.setImgPath(rs.getString("SP_IMG_PATH"));
				detailVo.setAddr(rs.getString("SP_ADDR"));
				detailVo.setPhone(rs.getString("SP_PHONE"));
				detailVo.setPrice(rs.getString("SP_PRICE"));
				detailVo.setOffday(rs.getString("SP_OFFDAY"));
				detailVo.setContent(rs.getString("SP_CONTENT"));
				detailVo.setXlat(rs.getString("SP_LAT"));
				detailVo.setYlong(rs.getString("SP_LONG"));
				
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
