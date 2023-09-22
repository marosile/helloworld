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
    
    private int companyNo; // 회사 번호
    
    private String jobField; // 모집 분야 (백엔드 개발자, 프론트엔드 개발자, ...)
    
    private String experiencePeriod; // 경력 기간 (신입, 3년차부터~)
    
    private String workConditions; // 근무 형태 (사무실, 재택, 하이브리드)
    
    private String workConditionsDetail; // 근무 조건 (형태의 상세)
    
    private String selectionProcess; // 전형 절차 (모집 및 선발 과정)
    
    private String employmentType; // 고용 형태 (인턴, 계약직, 정규직)
    
    private String employmentBenefits; // 복리 후생

}
