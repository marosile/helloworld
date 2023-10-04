package io.marosile.helloworld.board.model.service;

import io.marosile.helloworld.board.model.dto.Board;

import java.util.List;

public interface BoardService {

    List<Board> selectFollowingBoardList(String memberId);

}
