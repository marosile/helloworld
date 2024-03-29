package io.marosile.helloworld.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.marosile.helloworld.board.model.service.BoardService;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.board.model.dto.Tag;
import io.marosile.helloworld.board.model.service.BoardService_OHS;
import io.marosile.helloworld.board.model.service.BoardService_PHJ;
import io.marosile.helloworld.board.model.service.TagService;
import io.marosile.helloworld.member.model.dto.Member;

@SessionAttributes("loginMember")
@RequestMapping("/board")
@Controller
public class BoardController {

    @Autowired
    private BoardService_OHS service;

    @Autowired
    private BoardService_PHJ service2;

    @Autowired
    private BoardService boardService;

    @Autowired
    private TagService service3;

    @PostMapping("/getFeeds")
    @ResponseBody
    public String getFeeds(String memberId) throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(boardService.selectFollowingBoardList(memberId));
    }

    @PostMapping("/getRecents")
    @ResponseBody
    public String getRecents() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(boardService.selectRecentBoardList());
    }

    @PostMapping("/getPopulars")
    @ResponseBody
    public String getPopulars() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(boardService.selectPopularBoardList());
    }

    // 게시글 목록 조회 ( posts 10개, 검색어 유무 확인 )
    @GetMapping("/{boardCode:[1-3]}")
    public String boardList(Model model, @PathVariable("boardCode") int boardCode
                    , @RequestParam(value = "searchKeyword", required = false) String searchKeyword
                    , @SessionAttribute(value = "loginMember", required = false) Member loginMember) {


        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardCode", boardCode);
        map.put("searchKeyword", searchKeyword);
        List<Board> boardList = service2.selectBoardList(map);

        List<Board> getTopList = service2.getTopList();

        map.put("loginMember", loginMember);
        map.put("boardList", boardList);
        map.put("getTopList", getTopList);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("map", map);
        return "board/board-list";
    }


    // 최신순, 조회순 눌렀을 때 10개 ajax, 검색어 유무 확인
    @GetMapping(value = "/getBoardList", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<Board> getBoardList(@RequestParam("boardCode") int boardCode, @RequestParam(value = "sortType", defaultValue = "recent") String sortType, @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {

        Map<String, Object> parameters = new HashMap<>();

        parameters.put("boardCode", boardCode);
        parameters.put("sortType", sortType);
        parameters.put("searchKeyword", searchKeyword);

        List<Board> boardList = service.loadBoardList(parameters);

        return boardList;
    }


    // 게시글 목록 무한스크롤(최신순, 조회순 구분, 검색어 유무 확인)
    @GetMapping(value = "/loadPosts", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<Board> loadPosts(@RequestParam("page") int page, @RequestParam("boardCode") int boardCode, @RequestParam(value = "sortType", defaultValue = "recent") String sortType, @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {
        int pageSize = 10; // 한 페이지에 표시할 게시글 수
        int start = (page - 1) * pageSize + 1; // 첫 매핑 -> 11 두번째 매핑 -> 21 , ...
        int end = page * pageSize; // 첫 매핑 -> 20, 두번째 매핑 -> 30 , ...

        Map<String, Object> parameters = new HashMap<>();

        parameters.put("boardCode", boardCode);
        parameters.put("start", start);
        parameters.put("end", end);
        parameters.put("sortType", sortType);
        parameters.put("searchKeyword", searchKeyword);

        List<Board> postList = new ArrayList<>();

        if ("recent".equals(sortType)) {
            // 최신순으로 데이터를 가져오는 로직을 구현
            postList = service.loadRecentPosts(parameters);
        }

        if ("readCount".equals(sortType)) {
            // 조회순으로 데이터를 가져오는 로직을 구현
            postList = service.loadReadCountPosts(parameters);
        }

        return postList;
    }

    // 게시글 상세 조회
    @GetMapping("/{boardCode}/{boardNo}")
    public String boardDetail(@PathVariable("boardCode") int boardCode, @PathVariable("boardNo") int boardNo, Model model, RedirectAttributes ra, @SessionAttribute(value = "loginMember", required = false) Member loginMember, HttpServletRequest req, HttpServletResponse resp) throws ParseException {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("boardCode", boardCode);
        map.put("boardNo", boardNo);

        // 일반게시판 = type 0
        int boardType = 0;
        map.put("boardType", boardType);

        Board board = service2.selectBoard(map);

        List<Tag> tagList = service3.tagSelect(map);

        List<String> tagNames = new ArrayList<>();
        for (Tag tag : tagList) {
            tagNames.add(tag.getTagName());
        }

        if (boardCode == 1) board.setBoardName("공지사항");

        if (boardCode == 2) board.setBoardName("자유 게시판");

        if (boardCode == 3) board.setBoardName("Q&A 게시판");


        String path = null;

        if (board != null) {

            if (loginMember != null) {

                map.put("memberId", loginMember.getMemberId());

                // 북마크 조회
                int result = service2.bookMarkCheck(map);
                if (result > 0) model.addAttribute("bookMarkCheck", "on");

                // 좋아요 조회
                int result2 = service2.likeCheck(map);

                if (result2 > 0) model.addAttribute("likeCheck", "on");

            }

            // ---------- 조회수 -----------------------

            if (loginMember == null || loginMember.getMemberId() != board.getMemberId()) {

                Cookie c = null;

                Cookie[] cookies = req.getCookies();

                if (cookies != null) {

                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("readBoardNo")) {
                            c = cookie;
                            break;
                        }
                    }
                }

                int result = 0;

                if (c == null) {

                    c = new Cookie("readBoardNo", "|" + boardNo + "|");

                    result = service2.updateReadCount(boardNo);

                } else {

                    if (c.getValue().indexOf("|" + boardNo + "|") == -1) {

                        c.setValue(c.getValue() + "|" + boardNo + "|");

                        result = service2.updateReadCount(boardNo);

                    }
                }

                if (result > 0) {

                    board.setReadCount(board.getReadCount() + 1);


                    c.setPath("/");

                    Calendar cal = Calendar.getInstance(); // 싱글톤 패턴
                    cal.add(Calendar.DATE, 1);

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                    Date a = new Date();

                    Date temp = new Date(cal.getTimeInMillis());

                    Date b = sdf.parse(sdf.format(temp));

                    long diff = (b.getTime() - a.getTime()) / 1000;

                    c.setMaxAge((int) diff);

                    resp.addCookie(c);

                }
            }

            path = "board/board-detail";


            model.addAttribute("board", board);
            model.addAttribute("tagList", tagList);


        } else {
            path = "redirect:/board/" + boardCode;

            ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
        }

        return path;
    }

    // 북마크 처리
    @PostMapping("/bookMark")
    @ResponseBody
    public int bookMark(@RequestBody Map<String, Object> map) {

        return service2.bookMark(map);
    }

    // 팔로우 처리
    @PostMapping("/follow")
    @ResponseBody
    public int follow(@RequestBody Map<String, Object> map) {

        String userId = (String) map.get("userId");
        String memberId = (String) map.get("memberId");
        
        return service2.follow(map);
    }


    // 좋아요 처리
    @PostMapping("/like")
    @ResponseBody
    public int like(@RequestBody Map<String, Object> map) {

        return service2.like(map);
    }

    // 신고글 작성
    @PostMapping("/report")
    @ResponseBody
    public int insertReport(@RequestBody Map<String, Object> map) {

        return service2.insertReport(map);
    }

}
