package io.marosile.helloworld.study.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class studyComment {

    private int commentNo;
    private int boardNo;
    private String memberId;
    private String commentContent;
    private String createDate;
    private String modifyDate;
    private int parentNo;
    private String commentDeleteFlag;
    private String memberNickname;
    private String profileImage;
}
