package io.marosile.helloworld.recruit.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Recruit {

    private int boardNo; // 게시글 번호
    private String jobField; // 모집 분야 (백엔드 개발자, 프론트엔드 개발자, ...) //POSITION
    private String experiencePeriod; // 경력 기간 (신입, 3년차부터~) //EXPR_PERIOD
    private String workConditions; // 근무 형태 (사무실, 재택, 하이브리드) //EMPL_TYPE
    private String workConditionsDetail; // 근무 조건 (형태의 상세) //EMPL_CNDT
    private String selectionProcess; // 전형 절차 (모집 및 선발 과정) //ENTR_EXAM
    private String employmentType; // 고용 형태 (인턴, 계약직, 정규직) //JOB_TYPE
    private String employmentBenefits; // 복리 후생
    private String salaryInfo; // 연봉정보
    
    private int companyNo; // 회사 번호
	private String companyName; //회사 이름
	private String companyLogo; //회사 로고
	private String companyAddress; // 회사 주소
	private String companyIntroduce; // 회사 소개
	private String companyId;
	private int companyMcount;
	private String companyCreateDt;
	
	private String boardTitle; // 채용 공고 제목
	private String boardContent; // 채용 공고 내용
	
	private String memberId;

    
}
