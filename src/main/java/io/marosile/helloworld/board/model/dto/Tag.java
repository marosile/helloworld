package io.marosile.helloworld.board.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Tag {
	
	// TAG
	private int tagNo;
    private String tagName;
    
    // BOARD 삽입해서 BOARDNO가져와서 TAG에 넣고 쓰기
    private int boardNo;
    // 일반게시글 -> 0
    private int boardType;
    
    // TAG_DEPENDENCY

    
    // TAG_RELATION
    
}
