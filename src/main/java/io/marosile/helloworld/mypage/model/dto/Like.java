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
public class Like {
	
	// 좋아요 DTO
	private int boardNo; // 게시글 번호
	private String memberId; // 멤버 아이디

}
