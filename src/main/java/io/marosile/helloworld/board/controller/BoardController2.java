package io.marosile.helloworld.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpHeaders;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@RequestMapping("/board2")
@Controller
public class BoardController2 {
	
	
	// 게시글 수정
	@GetMapping("/update")
	public String boardUpdate() {
		
		return "board/board-update";
	}
	
	// 게시글 작성
	@GetMapping("/write")
	public String boardWrite() {
		
		return "board/board-write";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
	    JsonObject jsonObject = new JsonObject();

	    // Get the ServletContext from the HttpServletRequest
	    ServletContext context = request.getServletContext();
	    String fileRoot = context.getRealPath("/") + "resources/fileupload/";

	    String originalFileName = multipartFile.getOriginalFilename(); // Original file name
	    String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // File extension
	    String savedFileName = UUID.randomUUID() + extension; // Saved file name

	    File targetFile = new File(fileRoot + savedFileName);
	    try {
	        InputStream fileStream = multipartFile.getInputStream();
	        FileUtils.copyInputStreamToFile(fileStream, targetFile); // Save the file
	        jsonObject.addProperty("url", "/summernote/resources/fileupload/" + savedFileName); // URL of the saved file
	        jsonObject.addProperty("responseCode", "success");
	    } catch (IOException e) {
	        FileUtils.deleteQuietly(targetFile); // Delete the file if an error occurs
	        jsonObject.addProperty("responseCode", "error");
	        e.printStackTrace();
	    }

	    String responseJson = jsonObject.toString();
	    return responseJson;
	}
	

	}
