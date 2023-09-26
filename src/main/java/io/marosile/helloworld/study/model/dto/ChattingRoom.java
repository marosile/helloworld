package io.marosile.helloworld.study.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ChattingRoom {

    private int chattingNo; // 체팅번호
    private String createDt; // 생성일시
    private String croomType; // 채팅방타입


    private int studyNo;
    private String studyTitle; // 스터디 이름
    private String leaderId; // 체팅방 생성자

    private String targetNickName;
    private int notReadCount;


}
