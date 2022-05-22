package com.kh.mybatis.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.mybatis.board.model.vo.Board;
import com.kh.mybatis.common.util.PageInfo;

public class BoardDao {
	public int getBoardCount(SqlSession session, List<String> filters) {

		return session.selectOne("boardMapper.getBoardCountByFilters", filters);
	}
	
	public List<Board> findAll(SqlSession session, String writer, String title, String content) {
		Map<String, String> map = new HashMap<>();
		
		map.put("writer", writer);
		map.put("title", title);
		map.put("content", content);
		
		return session.selectList("boardMapper.selectAll", map);
	}

	public List<Board> findAll(SqlSession session, String[] filters, PageInfo pageInfo) {
		/*
		 * List 타입이나 Array 타입의 데이터를 파라미터로 전달하면 내부적으로 Map으로 타입이 변환되어서 저장되기 때문에
		 * Mapper에서는 list(또는 collection)나 array라는 이름으로 사용해야 한다.
		 * 
		 * 	Dao.java
		 * 		session.selectList("boardMapper.selectBoardListByFilters", filters);
		 * 
		 *  Mapper.xml
		 *  	<if test="array != null">
		 *  		...
		 *  	</if>
		 *  
		 * 만약에 filters라는 이름을 Mapper에서 사용하고 싶으면 Map 객체에 담아서 파라미터로 전달한다.
		 */
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("filters", filters);
		
		/*
		 * 기존에 Servlet/JSP에서는 쿼리문에서 rownum과 서브쿼리를 통해서 페이징 처리를 하였다.
		 * 하지만 mybatis 에서는 페이징 처리를 위해 RowBounds라는 클래스를 제공해 준다.
		 * 
		 * RowBounds의 객체를 생성할 때 offset과 limit 값을 전달해서 페이징 처리를 쉽게 구현한다.
		 * (offset 만큼 건너뛰고 limit 만큼 가져온다.)
		 * 
		 * offset = 0, limit = 10
		 *   - 0개를 건너뛰고 10개를 가져온다. (1 ~ 10)
		 * offset = 10, limit = 10
		 *   - 10개를 건너뛰고 10개를 가져온다. (11 ~ 20)
		 * offset = 20, limit = 10
		 *   - 20개를 건너뛰고 10개를 가져온다. (21 ~ 30)
		 * 
		 */
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return session.selectList("boardMapper.selectBoardListByFilters", map, rowBounds);
	}

	public Board findBoardByNo(SqlSession session, int no) {
		
		return session.selectOne("boardMapper.selectBoardByNo", no);
	}

	public int insertBoard(SqlSession session, Board board) {
		
		return session.insert("boardMapper.insertBoard", board);
	}

	public int updateBoard(SqlSession session, Board board) {
		
		return session.update("boardMapper.updateBoard", board);
	}

	public int updateStatus(SqlSession session, int no, String status) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("no", no);
		map.put("status", status);
		
		return session.update("boardMapper.updateStatus", map);
	}
}
