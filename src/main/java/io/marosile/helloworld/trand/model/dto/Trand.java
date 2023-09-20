package io.marosile.helloworld.trand.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Trand {
	
	private String type;
	private int boardNo;
    private String boardTitle;
    private int likeCount;
    private int readCount;
    
    private String memberId; 
    private String memberNick; 
    private String profileImg; 

    

	

}
