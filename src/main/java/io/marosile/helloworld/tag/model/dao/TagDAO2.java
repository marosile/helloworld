package io.marosile.helloworld.tag.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class TagDAO2 {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public List<String> selectTagList() { return sqlSession.selectList("tagMapper.selectTagList"); }

    @Transactional
    public int insertTagList(List<String> tags) {
        for(String tag : tags) sqlSession.insert("tagMapper.insertTag", tag);
        return 1;
    }

    @Transactional
    public int insertTagRelation(String tag, int itemType, int itemNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("tag", tag);
        map.put("itemType", itemType);
        map.put("itemNo", itemNo);
        return sqlSession.insert("tagMapper.insertTagRelation", map);
    }

    @Transactional
    public int deleteTagRelation(String tag, int itemType, int itemNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("tag", tag);
        map.put("itemType", itemType);
        map.put("itemNo", itemNo);
        return sqlSession.insert("tagMapper.deleteTagRelation", map);
    }

    @Transactional
    public int deleteTagRelations(int itemType, int itemNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("itemType", itemType);
        map.put("itemNo", itemNo);
        return sqlSession.insert("tagMapper.deleteTagRelations", map);
    }

}
