package io.marosile.helloworld.chat.model.dto;

import io.marosile.helloworld.member.model.dto.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ChatRoom {

    private int chatRoomNo;
    private Date createDate;
    private int messageUnread;
    private List<Message> messages;
    private List<Member> participants;

}
