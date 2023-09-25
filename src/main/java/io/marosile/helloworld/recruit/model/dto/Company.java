package io.marosile.helloworld.recruit.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class Company {
	
	
	private int companyNo; // 회사 번호 (회사 아이디)
	private String memberId; // 담당자 아이디
	private String companyName; //회사 이름
	private String companyAddress; // 회사 주소
	private String companyLogo; // 회사 로고
	private String companyIntroduce; // 회사 소개
	private int companyMcount;  // 사원수
	private String companyFl; // 담당자로 등록 여부

}
