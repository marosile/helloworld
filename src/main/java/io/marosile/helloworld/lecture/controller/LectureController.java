package io.marosile.helloworld.lecture.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.lecture.model.dto.Lecture;
import io.marosile.helloworld.lecture.model.service.LectureService;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class LectureController {

	@Autowired
	private LectureService service;

	@GetMapping("/lecture")
	public String lectureList() {
		return "lecture/lecture-list";
	}

	@GetMapping("/lecture/{lectureNo}")
	public String lectureDetail(@PathVariable("lectureNo") int lectureNo, Model model) {
		model.addAttribute("lecture", service.lectureDetail(lectureNo));
		return "lecture/lecture-detail";
	}

	@PostMapping("/lecture/populars")
	@ResponseBody
	public String popularLectureList() throws JsonProcessingException {
		return new ObjectMapper().writeValueAsString(service.popularLectureList());
	}

	@PostMapping("/lecture/recents")
	@ResponseBody
	public List<Lecture> recentLectureList() {
		return service.recentLectureList();
	}

}
