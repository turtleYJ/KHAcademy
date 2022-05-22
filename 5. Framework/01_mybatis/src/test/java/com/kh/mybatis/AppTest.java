package com.kh.mybatis;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.kh.mybatis.common.template.SqlSessionTemplate;

@DisplayName("첫 번째 테스트 코드 작성")
public class AppTest {
	private SqlSession session = null;
	
	// 테스트 메소드들이 실행되기 전에 실행되는 메소드 (한 번만 실행된다.)
	@BeforeAll
	public static void init() {
		System.out.println("@BeforeAll");
	}
	
	// 각각의 테스트 메소드들이 실행되기 전에 무조건 실행되는 메소드
	@BeforeEach
	public void setup() {
		System.out.println("@BeforeEach");
		
		session = SqlSessionTemplate.getSession();
	}
	
	@Test
	@Disabled // 테스트 클래스 또는 메소드를 비 활성할 수 있다. 
	public void nothing() {
		// 이 테스트 메소드를 통해서 현재 프로젝트가 테스트 가능한 환경인지 확인한다.
	}
	
	@Test
	@DisplayName("SqlSession 생성 테스트")
	public void create() {
		assertNotNull(session);
	}
}
