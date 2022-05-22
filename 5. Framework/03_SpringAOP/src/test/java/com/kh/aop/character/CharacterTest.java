package com.kh.aop.character;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"classpath:root-context.xml"})
class CharacterTest {
	/*
	 * AOP 용어 정리
	 * 1. Aspect
	 *   - AOP 횡단 관심사(한 애플리케이션의 여러 부분에 공통적으로 사용하고 있는 기능)를 애스펙트라는 특별한 클래스로 모듈화해서 관리한다.
	 *   - Aspect는 Advice와 PointCut를 합친 것이다.
	 *   
	 * 2. JoinPoint
	 *   - Advice를 적용할 수 있는 모든 지점을 조인 포인트라고 한다.
	 *   - 즉, JoinPoint는 애플리케이션 실행에 공통적인 기능을 끼워 넣을 수 있는 지점(Point)을 말한다.
	 *     (메소드 호출 지점이나 예외 발생 등)
	 * 
	 * 3. Advice
	 *   - Aspect가 해야하는 작업(공통적으로 사용하고 있는 기능)과 언제 그 작업을 수행해야 하는지 정의하는 것을 AOP 용어로 Advice라고 한다.
	 *   - 스프링 AOP에서는 5 종류의 Advice를 제공한다.
	 *     Before Advice : 어드바이스 대상 메소드가 호출되기 전에 어드바이스 기능을 수행한다.
	 *     After Advice : 결과 상관없이 어드바이스 대상 메소드가 완료된 후에 어드바이스 기능을 수행한다.
	 *     After-Returning Advice : 어드바이스 대상 메소드가 성공적으로 완료된 후에 어드바이스 기능을 수행한다.
	 *     After-Throwing Advice : 어드바이스 대상 메소드가 예외를 던진 후에 어드바이스 기능을 수행한다.
	 *     Around Advice : 어드바이스 대상 메소드 호출 전과 후에 어드바이스 기능을 수행한다.
	 *     
	 * 4. PointCut
	 *   - Advice가 적용될 조인 포인트의 영역을 좁히는 일을 한다.
	 *   - Advice는 Aspect가 해야하는 '작업'과 '언제' 그 작업을 수행해야 하는지 정의하는 것이라면 PointCut는 '어디에' 어드바이스를 적용할지 정의하는 것이다.
	 *   - PointCut를 지정하기 위해서는 AspectJ 포인트 커트 표현식을 통해서 지정해 줄 수 있다.
	 *   
	 * 
	 * * AspectJ 포인트커트 표현식
	 *   - 스프링 AOP에서 포인트커트는 AspectJ의 포인트 커트 표현식을 이용해서 정의한다.
	 *   - 스프링 AOP에서 지원되는 AspectJ의 포인트 커트 표현식
	 *     execution([접근지정자] 리턴타입 클래스이름.메소드명(파라미터)) : 메소드 실행에 대한 조인 포인트를 지정한다.
	 *     	접근지정자 : public, private, .. 값을 적어준다. (생략 가능)
	 *     	리턴 타입 : 메소드의 반환값을 의미한다.
	 *      클래스 이름 : 클래스의 풀 패키지명이 포함된 이름을 적어둔다.
	 *      " * " : 모든 값을 표현한다.
	 *      " .. " : 0개 이상을 의미한다.
	 *     args(파라미터) : 타겟 메소드에 전달되는 파라미터 값을 어드바이스에 전달하기 위한 파라미터를 지정한다.
	 *     bean(빈ID) : 포인트 커트 표현식 내에서 빈ID 특정 빈을 지정할 수 있다.
	 *     @annotation(어노테이션이름(풀패키지명)) : 주어진 어노테이션을 갖는 조인 포인트를 지정한다.
	 */
	
	@Autowired
	private Character character;
	
	@Test
	void test() {
	}
	
	@Test
	void create() {
		System.out.println(character);
		
		assertThat(character).isNotNull();
		assertThat(character.getWeapon()).isNotNull();
	}
	
	@Test
	void questTest() throws Exception {
		
		assertThat(character.quest("일시점검")).contains("[일시점검]");
	}
	
	@Test
	void attackTest() throws Exception {
		
		assertThat(character.getWeapon().attack()).isNotNull();
	}
}
