package io.marosile.helloworld.board.model.service;

import io.marosile.helloworld.board.model.dao.BoardDAO;
import io.marosile.helloworld.board.model.dto.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO dao;

    @Override
    public List<Board> selectFollowingBoardList(String memberId) {
        return dao.selectFollowingBoardList(memberId);
    }
}
