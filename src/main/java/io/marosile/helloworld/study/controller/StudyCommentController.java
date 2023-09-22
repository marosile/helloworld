package io.marosile.helloworld.study.controller;

import io.marosile.helloworld.study.model.dto.studyComment;
import io.marosile.helloworld.study.model.service.StudyCommentService;
import io.marosile.helloworld.study.model.service.StudyCommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class StudyCommentController {

    @Autowired
    private StudyCommentService service;

    // 댓글 작성
    @PostMapping(value = "/commentStudy")
    public int insert(@RequestBody studyComment comment){


        System.out.println(comment);

        return service.insert(comment);

    }

    // 댓글 목록 조회
    @GetMapping(value = "/commentStudy", produces = "application/json; charset=UTF-8")
    public List<studyComment> select(@RequestParam("boardNo") int boardNo){

        System.out.println(boardNo);

        return service.select(boardNo);

    }

    //댓글 삭제
    @DeleteMapping("/commentStudy")
    public int delete(@RequestBody int commentNo){
        return service.delete(commentNo);
    }

    // 댓글 수정
    @PutMapping("/commentStudy")
    public int update(@RequestBody studyComment comment){
        return service.update(comment);
    }



}
