package io.marosile.helloworld.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpHeaders;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.dto.Tag;
import io.marosile.helloworld.board.model.service.BoardService_OHS;
import io.marosile.helloworld.board.model.service.BoardService_PHJ;
import io.marosile.helloworld.board.model.service.TagService;
import io.marosile.helloworld.member.model.dto.Member;


@RequestMapping("/board2")
@Controller
@SessionAttributes("loginMember")
public class BoardController2 {
	
	@Autowired
	private BoardService_OHS service;
	
	@Autowired
	private BoardService_PHJ service2;
	
	@Autowired
	private TagService service3;
	
	
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
							,@RequestParam(name = "tagInputs", required = false) List<String> tags // board안에 삽입
							, RedirectAttributes ra) {

		board.setMemberId(loginMember.getMemberId());
		board.setBoardCode(boardCode);
		
		int boardNo = service.boardInsert(board);

		List<Tag> tagList = new ArrayList<>(); // 태그 객체를 저장할 리스트 생성

		if (tags != null) {
		    for (String tagName : tags) {
		        Tag tag = new Tag();
		        tag.setTagName(tagName);
		        tag.setBoardNo(boardNo);
		        tag.setBoardType(0);// 일반게시글 == 0
		        tagList.add(tag);
		    }
		}
		
		int result = service3.tagInsert(tagList);
		
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
	public String boardUpdate(@PathVariable("boardCode") int boardCode,
	                         @PathVariable("boardNo") int boardNo,
	                         Model model) {
	    Map<String, Object> map = new HashMap<>();
	    
	    map.put("boardCode", boardCode);
	    map.put("boardNo", boardNo);
	    int boardType = 0;
	    map.put("boardType", boardType);
	    
	    List<Tag> tagList = service3.tagSelect(map);
	    
	    // 태그 이름 담기
	    List<String> tagNames = new ArrayList<>(); 
	    
	    for (Tag tag : tagList) {
	   	 tagNames.add(tag.getTagName()); 
	   	}

	    // 태그 목록을 JSON 형태로 변환하여 모델에 추가
	    Gson gson = new Gson();
	    String tagListJson = gson.toJson(tagNames);
	    model.addAttribute("tagListJson", tagListJson);
	    
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
							 ,@RequestParam(name = "tagInputs", required = false) List<String> tags
							 ) {
		
		Map<String, Object> map = new HashMap<>();
		
	    map.put("boardCode", boardCode);
	    map.put("boardNo", boardNo);
	    int boardType = 0;
	    map.put("boardType", boardType);
	    
	    // 수정 페이지에서의 tagList 가져오기
	    List<Tag> tagList = service3.tagSelect(map);
	    

	    
		board.setMemberId(loginMember.getMemberId());
		board.setMemberNickname(loginMember.getMemberNick());
		
		int result = service.boardUpdate(board);
		
		String path = "redirect:";
		if(result == 1) { // 게시글 수정 성공하면
			
		    // 수정에서 태그 변경했을때 
		    for (int i = 0; i < tagList.size() && i < tags.size(); i++) {
		        tagList.get(i).setTagName(tags.get(i));
		    }
		    
			// 기존 태그 업데이트
			int result2 = service3.tagUpdate(tagList);

			 // 새로운 태그 추가
			if (tags != null && !tags.isEmpty()) {
				// 새로운 태그만 저장할 리스트 
				List<Tag> newTagsList = new ArrayList<>();

				// 중복 체크를 위한 기존 태그 목록 
				List<Tag> existingTags = new ArrayList<>();

				// 기존 태그 목록을 생성
				for (Tag existingTag : tagList) {
				    existingTags.add(existingTag);
				}

				for (String newTag : tags) {
				    // 중복된 태그가 아니라면 새로운 태그 목록에 추가
				    Tag tag = new Tag();
				    tag.setBoardNo(boardNo);
				    tag.setBoardType(0); // 일반게시글 == 0
				    tag.setTagName(newTag);
				    
				    if (!existingTags.contains(tag)) {
				        newTagsList.add(tag); // 포함 안하면 추가
				    }
				}

				// 수정에서의 태그 추가 insert
				int result3 = service3.tagInsert(newTagsList);
			
			path += "/board/" + boardCode + "/" + boardNo;

		}else {
			
			path +=  "/board/" + boardCode;
		}
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
	
	
	// 게시글 삭제
	@GetMapping("/{boardCode}/{boardNo}/delete")
	public String deleteBoard(@PathVariable("boardCode") int boardCode
						  ,@PathVariable("boardNo") int boardNo) {
		
		String path = "redirect:";
		
		int result = service.boardDelete(boardNo);
		
		if(result == 1) {
			
			path +="/board/" + boardCode;
			
		}else {
			
			path +="/board/" + boardCode + boardNo;
		}
		
		return path;
		
	}
	
}
