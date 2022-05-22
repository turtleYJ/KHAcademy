package com.kh.stream.terminal;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.kh.stream.model.vo.Student;

public class C_Collect {
	/*
	 * 수집
	 *   - 스트림 요소들은 필터링 또는 매핑한 후 요소들을 수집하는 최종 처리 메소드인 collect()를 제공한다.
	 *   - collect() 메소드를 사용하면 필요한 요소만 새로운 컬렉션으로 담아서 리턴받을 수 있다.
	 */
	
	public void method1() {
		List<Student> students = Arrays.asList(
			new Student("문인수", 29, "남자", 80, 70),
			new Student("이몽룡", 23, "남자", 50, 60),
			new Student("성춘향", 20, "여자", 100, 100)	,	
			new Student("심청이", 16, "여자", 100, 100)	,	
			new Student("홍길동", 18, "남자", 40, 80)				
		);
		
		List<Student> maleList = students.stream()
										 .filter(student -> student.getGender().equals("남자"))
										 .collect(Collectors.toList());
				
		maleList.stream().forEach(student -> System.out.println(student));
		
		System.out.println();
		
		Set<Student> femaleList = students.stream()
										  .filter(student -> student.getGender().equals("여자"))
//										  .collect(Collectors.toSet());
//										  .collect(Collectors.toCollection(() -> {return new HashSet<>();}));    
										  .collect(Collectors.toCollection(HashSet::new));    
		
		femaleList.stream().forEach(student -> System.out.println(student));
		
		Map<String, Student> studentMap = students.stream()
								.collect(Collectors.toMap(student -> student.getName(), student -> student));
		
		System.out.println(studentMap);
	}
}
