package io.marosile.helloworld.mypage.model.dto;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Comment;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class PostList {
	
	// BOARD 테이블
	private int boardNo;
	private String boardTitle; // BOARD_TITLE - 게시글 제목
	private String createDate; // CREATE_DT - 게시글 작성 날짜
	private int readCount; 	   // READ_COUNT - 조회수
	
	// BOARD_GENERAL 테이블
	private int boardCode; // BOARD_CODE - 게시판 코드
	
	// MEMBER 테이블
	private String memberNickname;
	
	// COMMENT 테이블
    private List<Comment> commentList; 
    private int commentCount;
    
    // LIKE 테이블
    private String memberId;
    private int likeCount;
    
    // Follow
    private String followFrom;
    private String followTo;
}


