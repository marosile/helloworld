package io.marosile.helloworld.member.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class Member {

    private String memberId;
    private String memberPw;
    private String memberNick;
    private String memberEmail;
    private String memberTel;
    private String profileImg;
    private String enrollDate;
    private String promotionFl;
    private String deleteFl;

}
