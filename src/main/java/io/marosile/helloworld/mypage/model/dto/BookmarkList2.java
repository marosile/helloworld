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
	private String companyAddress; 	 // 회사 이름
	
	
	// BOARD_RECRUIT
	private String experiencePeriod; // 신입 ~ 몇년차
	private String employeeType; 	 // 근무형태 (사무실, 집)
	
	
	
	

}
