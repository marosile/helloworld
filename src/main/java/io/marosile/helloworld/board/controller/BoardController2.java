package io.marosile.helloworld.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpHeaders;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.service.BoardService_OHS;
import io.marosile.helloworld.board.model.service.BoardService_PHJ;
import io.marosile.helloworld.member.model.dto.Member;


@RequestMapping("/board2")
@Controller
@SessionAttributes("loginMember")
public class BoardController2 {
	
	@Autowired
	private BoardService_OHS service;
	
	@Autowired
	private BoardService_PHJ service2;
	
	// 게시글 작성 페이지로
	@GetMapping("/{boardCode}/write")
	public String boardWrite(@PathVariable("boardCode") int boardCode) {
		
		return "board/board-write";
	}
	
	// 게시글 작성 
	@PostMapping("/{boardCode}/write")
	public String boardWrite(@PathVariable("boardCode") int boardCode
							,@ModelAttribute Board board
							,@SessionAttribute("loginMember") Member loginMember
							, RedirectAttributes ra) {
		
		board.setMemberId(loginMember.getMemberId());
		board.setBoardCode(boardCode);
		
		System.out.println(board);
		
		int boardNo = service.boardInsert(board);
		
		//String message = null;
		String path = "redirect:";
		
		if(boardNo > 0) { 
			
			//message = "게시글 등록 완료";
			path += "/board/" + boardCode + "/" + boardNo;
			
		} else {
			
			//message = "게시글 등록 실패";
			path += "board" + boardCode;
		}
		
		//ra.addFlashAttribute("message", message);
		
		return path;
	}
	
	// 게시글 수정 페이지로
	@GetMapping("/{boardCode}/{boardNo}/update")
	public String boardUpdate(@PathVariable("boardCode") int boardCode
						     ,@PathVariable("boardNo") int boardNo
						     , Model model
									) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardCode", boardCode);
		map.put("boardNo", boardNo);
		
		Board board = service2.selectBoard(map);
		
		model.addAttribute("board", board);
		
		return "board/board-update";
	}
	
	// 게시글 수정
	@PostMapping("/{boardCode}/{boardNo}/update")
	public String boardUpdate(@PathVariable("boardCode") int boardCode
							 ,@PathVariable("boardNo") int boardNo
							 ,@SessionAttribute("loginMember") Member loginMember
							 ,@ModelAttribute Board board
							 ) {
		
		System.out.println(board);
		board.setMemberId(loginMember.getMemberId());
		board.setMemberNickname(loginMember.getMemberNick());
		
		int result = service.boardUpdate(board);
		
		String path = "redirect:";
		if(result == 1) {
			System.out.println("성공");
			path = "/board/board-detail";
			
		}else {
			System.out.println("실패");
			path = "/board/board-list";
		}
		
		return path;
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		System.out.println(contextRoot);
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}
