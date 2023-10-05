package io.marosile.helloworld.study.model.dto;

import io.marosile.helloworld.board.model.dto.Comment;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Study {

    // board_study
    private int studyNo;
    private String location;
    private String headCount;
    private String studyStatus;
    private String select1;

    // board
    private int boardNo;
    private String boardTitle;
    private String boardContent;
    private String createDate;
    private String modifyDate;
    private String deletedFl;
    private int readCount;
    private String memberTel;

    // member
    private String memberId;
    private String memberNickname;
    private String memberProfileImg;

    //tag
    private int tagNo;
    private String tagNm;

    // LIKE
    private int likeCount;


    //comment
    private List<studyComment> studyCommentList;

    //follow
    private String followFrom;
    private String followTo;





}
