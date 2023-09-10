package io.marosile.helloworld.board.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// oracle 연결 project 계정이라 임시임 

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {

	private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String boardCreateDate;
    private String boardUpdateDate;
    private int readCount;
    private int boardCode;
    
 
    private int commentCount; 
    private int likeCount;	  
    
    // 회원 join
    private String memberNickname; 
    private int memberNo;
    private String profileImage;
    private String thumbnail;

	
}
