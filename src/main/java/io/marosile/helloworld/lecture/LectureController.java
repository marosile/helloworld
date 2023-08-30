package io.marosile.helloworld.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {

	@GetMapping("/lecture")
	public String lecture() {
		return "lecture/lecture";
	}

}
