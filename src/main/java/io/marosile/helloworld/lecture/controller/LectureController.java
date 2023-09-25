package io.marosile.helloworld.lecture.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.lecture.model.dto.Lecture;
import io.marosile.helloworld.lecture.model.service.LectureService;
import io.marosile.helloworld.member.model.dto.Member;
import io.marosile.helloworld.member.model.service.MemberService;
import io.marosile.helloworld.tag.model.service.TagService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@SessionAttributes("loginMember")
public class LectureController {

	@Autowired
	private LectureService service;

	@Autowired
	private TagService tagService;

	@Autowired
	private MemberService memberService;

	@GetMapping("/lecture")
	public String lectureList() {
		return "lecture/lecture-list";
	}

	@GetMapping("/lecture/{lectureNo}")
	public String lectureDetail(@PathVariable("lectureNo") int lectureNo, Model model) {
		Lecture lecture = service.lectureDetail(lectureNo);
		lecture.setLecturer(memberService.getMemberById(lecture.getMemberId()));
		model.addAttribute("lecture", lecture);
		return "lecture/lecture-detail";
	}

	@GetMapping("/lecture/write")
	public String lectureWrite(@RequestParam(value="no", required = false) Integer no,
							   Model model) {
		if (no != null) {
			Lecture lecture = service.lectureDetail(no);
			model.addAttribute("lecture", lecture);
		}
		return "lecture/lecture-write";
	}

	@PostMapping("/lecture/write")
	public String lectureWrite(Lecture lecture,
							   @RequestParam(value="originalFilename", required=false) String originalFilename,
							   @RequestParam(value="thumbnail", required=false) MultipartFile image,
							   @SessionAttribute("loginMember") Member loginMember,
							   HttpServletRequest request) throws IOException, NullPointerException {
		tagService.insertTagList(lecture.getLectureTags());
		lecture.setMemberId(loginMember.getMemberId());
		lecture.setLectureThumbnail(originalFilename == null ? "/resources/images/lecture/thumbnail/" + image.getOriginalFilename() : originalFilename);
		int result = 0;
		if (lecture.getLectureNo() != 0) {
			System.out.println(111 + "asdf");
			tagService.deleteTagRelation(2, lecture.getLectureNo());
			for (String tag : lecture.getLectureTags()) tagService.insertTagRelation(tag, 2, lecture.getLectureNo());
			result = service.updateLecture(lecture);
		} else {
			System.out.println(222 + "asdf");
			result = service.insertLecture(lecture);
		}
		System.out.println(result + "asdf");
		if (result == 0) return "redirect:/lecture";
		if (image.getSize() != 0) image.transferTo(new File(request.getSession().getServletContext().getRealPath("/") + lecture.getLectureThumbnail()));
		return "redirect:/lecture/" + lecture.getLectureNo();
	}

	@PostMapping("/lecture/delete")
	public int lectureDelete(int lectureNo) {
		tagService.deleteTagRelation(2, lectureNo);
		return service.deleteLecture(lectureNo);
	}

	@PostMapping("/lecture/populars")
	@ResponseBody
	public String popularLectureList() throws JsonProcessingException {
		List<Lecture> lectures = service.popularLectureList();
		for (Lecture lecture : lectures) lecture.setLecturer(memberService.getMemberById(lecture.getMemberId()));
		return new ObjectMapper().writeValueAsString(lectures);
	}

	@PostMapping("/lecture/recents")
	@ResponseBody
	public List<Lecture> recentLectureList() {
		return service.recentLectureList();
	}

}
