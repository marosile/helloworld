package io.marosile.helloworld.mypage.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class BookmarkList2 {
	
	// BOOKMARK
	private int boardNo;			 // 게시글 번호
	private String memberId;		 // 회원 아이디
	
	// COMPANY
	private String companyLogo; 	 // 회사 로고
	private String companyName; 	 // 회사 이름
	
	// RESUME
	private String experiencePeriod; // 경력 기간
	private String salaryExpect; 	 // 연봉 정보
	private String employeeType; 	 // 업무 형태
	private String employeeLocation; // 근무 지역
	

}
