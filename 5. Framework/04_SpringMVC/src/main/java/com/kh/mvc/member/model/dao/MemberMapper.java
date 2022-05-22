package com.kh.mvc.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
//	@Select("select * from member")
//	List<Member> findAll();

	Member findMemberById(@Param("id") String id);

	int insertMember(Member member);

	int updateMember(Member member);

	int deleteMember(int no);

}
