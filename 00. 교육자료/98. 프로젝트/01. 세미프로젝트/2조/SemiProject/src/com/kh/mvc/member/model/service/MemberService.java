package com.kh.mvc.member.model.service;

import static com.kh.mvc.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public Member login(String id, String password) {
		Member member = this.findMemberById(id);
		
		if(member != null && member.getPassword().equals(password)) {
			return member;			
		} else {
			return null;
		}
	}

	public int save(Member member) {
		int result = 0; 
		Connection connection = getConnection();
		
		if(member.getNo() != 0) {
			result = dao.updateMember(connection, member);
		} else {			
			result = dao.insertMember(connection, member);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public Boolean isDuplicateID(String id) {
		
		return this.findMemberById(id) != null;
	}
	
	public Member findMemberById(String id) {
		Connection connection = getConnection();
		Member member = dao.findMemberById(connection, id);
		
		close(connection);
		
		return member;
	}
	
	public Member findMemberID(String userName, String phone) {
		Connection connection = getConnection();
		Member member = dao.findMemberID(connection, userName, phone);
		
		close(connection);
		
		return member;
	}
	
	public Member findMemberPWD(String userId, String userName, String phone) {
		Connection connection = getConnection();
		Member member = dao.findMemberPWD(connection, userId, userName, phone);
		
		close(connection);
		
		return member;
	}
	
	// 회원탈퇴
	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();

		result = dao.updateMemberStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	// 비밀번호 변경
	public int updatePassword(int no, String password) {
		int result = 0;
		Connection connection = getConnection();
		
		result = dao.updateMemberPassword(connection, no, password);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
