package io.marosile.helloworld.lecture.model.dto;

import io.marosile.helloworld.member.model.dto.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Lecture {
    private int lectureNo;
    private Member lecturer;
    private String memberId;
    private String lectureTitle;
    private String lectureIntro;
    private String lectureThumbnail;
    private int lectureDifficulty;
    private List<Lesson> lessons;
    private List<String> lectureTags;
    private int lecturePrice;
    private float lectureSale;
}
