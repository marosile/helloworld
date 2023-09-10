package io.marosile.helloworld.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import io.marosile.helloworld.board.model.dto.Board;

@Repository
public class BoardDAO_OHS {

	private final SqlSessionTemplate sqlSession; 

    @Autowired
    public BoardDAO_OHS(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }
	
	public List<Board> loadPost(int start, int end) {
		
        Map<String, Object> parameters = new HashMap<>();
        
        parameters.put("start", start);
        parameters.put("end", end);
        
        return sqlSession.selectList("loadPost", parameters);
        
    }

}
