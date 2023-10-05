package io.marosile.helloworld.lecture.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Lesson {
    private int lectureNo;
    private int lessonNo;
    private String lessonTitle;
    private String videoPath;
}
