package io.marosile.helloworld.lecture.model.dto;

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
    private String memberId;
    private String lectureTitle;
    private String lectureIntro;
    private String lectureThumbnail;
    private String lectureDifficulty;
    private int lectureTimeLimit;
    private List<String> lectureTags;
}
