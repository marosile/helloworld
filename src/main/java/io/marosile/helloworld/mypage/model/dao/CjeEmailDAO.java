
package io.marosile.helloworld.mypage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate; import
org.springframework.beans.factory.annotation.Autowired; import
org.springframework.stereotype.Repository;

@Repository public class CjeEmailDAO {

	@Autowired private SqlSessionTemplate sqlSession;

	public int updateAuthKey(Map<String, String> map) {
		return sqlSession.update("myPageMapper.updateAuthKey", map);
	}

	public int insertAuthKey(Map<String, String> map) {
		return sqlSession.update("myPageMapper.insertAuthKey", map);
	}

	public int checkAuthKey(Map<String, Object> paramMap) {
		return sqlSession.selectOne("myPageMapper.checkAuthKey", paramMap);
	}

}
