package io.marosile.helloworld.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class LectureController {

	@GetMapping("/lecture")
	public String lectureList() {
		return "lecture/lecture-list";
	}

	@GetMapping("/lecture/{lectureNo}")
	public String lectureDetail(@PathVariable("lectureNo") int lectureNo) {
		return "lecture/lecture-detail";
	}
}
