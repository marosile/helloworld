package io.marosile.helloworld.study.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Study {

    // board_study
    private int studyNo;
    private String location;
    private String headCount;

    // board
    private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String createDate;
    private String modifyDate;
    private String deletedFl;
    private int readCount;


    // member
    private String memberId;
    private String memberNickname;

    //tag
    private int tagNo;
    private String tagNm;






}
