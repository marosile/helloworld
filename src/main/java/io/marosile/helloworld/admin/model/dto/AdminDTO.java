package io.marosile.helloworld.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AdminDTO {
	
    private String boardTitle;
	private int boardNo;
	private int reportNo;
	private String reportContent;
	
    private String memberId;


	/* 기업 담당자 자격 신청 관련 dto*/
	private int cmpnNo;
	private String userId;
	private String cmpnNm;
	private String cmpnAddr;
	private String cmpnLogo;
	private String cmpnIntro;
	private String cmpnMCount;
	private String cmpnFl;
	private String userTel;

}
