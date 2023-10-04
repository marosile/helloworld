package io.marosile.helloworld.chat.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Message {

    private int messageNo;
    private int chatRoomNo;
    private String memberId;
    private String memberNick;
    private String profileImg;
    private String messageContent;
    private Date sendDate;

}
