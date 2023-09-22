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
public class BookmarkList {
	
	// BOOKMARK
	private String boardNo; // 게시글 번호
	private String memberId; // 멤버 아이디
	
	// MEMBER
	private String memberNickname; // 멤버 닉네임
	private String profileImage; // 프사
	
	// BOARD
	private String createDate; // 게시글 게시 날짜
	private String boardTitle; // 게시글 제목
	private int readCount; //조회수
	
	// COMMENT
	private List<Comment> commentList;
    private int commentCount; // 댓글 수

}
