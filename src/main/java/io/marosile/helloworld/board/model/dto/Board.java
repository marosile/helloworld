package io.marosile.helloworld.board.model.dto;

import java.util.List;

import edu.emory.mathcs.backport.java.util.Arrays;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {

	// board
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
    private int likeCount;
    private int readCount;
    private String tagName;
    
    // member
    private String memberId; 
    private String memberNickname;
    private String profileImage;
    
    // comment
    private List<Comment> commentList;
    
    // tag
    private List<Tag> tagList;
}
