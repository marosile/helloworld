package io.marosile.helloworld.study.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Message {

    private int messageNo; // 메세지번호
    private String memberId; // 작성자아이디
    private String messageContent; // 메세지 내용
    private String sendTime; // 전송일시

    private int chattingNo; //채팅방번호
    private String sendDT; // 읽음

}
