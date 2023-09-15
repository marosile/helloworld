package io.marosile.helloworld.board.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//임시임 

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {

	private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String createDate;
    private String modifyDate;
    private String deletedFl;
    private int boardType;
    private int boardCode;
    private String boardName;
    private int check;
    
    // member
    private String memberId; 
    private String memberNickname;

	
}
