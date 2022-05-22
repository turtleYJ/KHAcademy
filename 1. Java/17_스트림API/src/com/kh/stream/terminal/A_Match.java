package com.kh.stream.terminal;

import java.util.Arrays;
import java.util.List;

import com.kh.stream.model.vo.Student;

public class A_Match {
	/*
	 * 매칭
	 *   - 최종 처리 단계에서 요소들이 특정 조건에 만족하는지 조사하는 기능이다.
	 *   - allMatch()
	 *   	- 모든 요소들이 매개 값으로 주어진 Predicate의 조건을 만족하는지 조사한다.
	 *   - anyMatch()
	 *   	- 최소한 한 개의 요소가 매개 값으로 주어진 Predicate의 조건을 만족하는지 조사한다.
	 *   - noneMatch()
	 *   	- 모든 요소들이 매개 값으로 주어진 Predicate의 조건을 만족하지 않는지 조사한다.
	 */
	
	public void method1() {
		boolean result = false;
		int[] values = {2, 4, 6};
		
		result = Arrays.stream(values).allMatch(value -> value % 2 == 0);
		
		System.out.println(result);
		
		result = Arrays.stream(values).anyMatch(value -> value % 3 == 0);
		
		System.out.println(result);
		
		result = Arrays.stream(values).noneMatch(value -> value % 5 == 0);
		
		System.out.println(result);
	}
	
	public void method2() {
		boolean result = false;
		List<Student> list = Arrays.asList(
			new Student("문인수", 29, "남자", 80, 70),
			new Student("이몽룡", 20, "남자", 50, 60),
			new Student("성춘향", 17, "여자", 100, 100)				
		);
		
		// 나이가 20살 이상인 학생들이 모두 남자인지 확인하시오.
		result = list.stream()
					 .filter(student -> student.getAge() >= 20)
					 .allMatch(student -> student.getGender().equals("남자"));
		
		System.out.println("20살 이상인 학생들은 모두 남자입니까 ? " + result);
		
		// 남학생들 중에 평균이 70점 이상인 학생이 한 명이라도 존재하는 확인하시오.
		result = list.stream()
					 .filter(student -> student.getGender().equals("남자"))
					 .anyMatch(student -> ((student.getEnglish() + student.getMath()) / 2) >= 70);
		
		System.out.println("남학생들 중에 평균이 70점 이상인 학생이 한 명이라도 존재하나요? " + result);
	}
}
