package io.marosile.helloworld.board.model.dao;

import io.marosile.helloworld.board.model.dto.Board;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {

    @Autowired
    private SqlSessionTemplate session;

    public List<Board> selectFollowingBoardList(String memberId) {
        return session.selectList("boardMapper.selectFollowingBoardList", memberId);
    }

    public List<Board> selectRecentBoardList() {
        return session.selectList("boardMapper.selectRecentBoardList");
    }

    public List<Board> selectPopularBoardList() { return session.selectList("boardMapper.selectPopularBoardList"); }
}
