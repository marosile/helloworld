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
}
