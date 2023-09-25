package io.marosile.helloworld.recruit.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EmploymentTest {
	
	 private String memberId;

	 private String question1; // 모집 분야 (백엔드 개발자, 프론트엔드 개발자, ...) //POSITION
	 private String question2; // 경력 기간 (신입, 3년차부터~) //EXPR_PERIOD
	 private int question3; // 희망 급여 // SALARY_EXPECT
	 private String question4; // 업무(근무) 형태 (사무실, 재택, 하이브리드) //EMPL_TYPE
	 private String question5; // 근무 지역 (서울 강남) // EMPL_LOCAITON
	 private List<String> question6; // 가능한 기술 -> 태그로 하나하나 삽입
	 private String question6ToString; // 가능한 기술 문자열로 , 삽입

}

