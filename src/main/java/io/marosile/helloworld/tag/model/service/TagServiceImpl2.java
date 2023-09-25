package io.marosile.helloworld.tag.model.service;

import io.marosile.helloworld.tag.model.dao.TagDAO2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagServiceImpl2 implements TagService {

    @Autowired
    private TagDAO2 dao;

    @Override
    public List<String> selectTagList() {
        return dao.selectTagList();
    };

    @Override
    public int insertTagList(List<String> tags) {
        return dao.insertTagList(tags);
    }

    @Override
    public int insertTagRelation(String tag, int itemType, int itemNo) { return dao.insertTagRelation(tag, itemType, itemNo); }

    @Override
    public int deleteTagRelation(String tag, int itemType, int itemNo) { return dao.deleteTagRelation(tag, itemType, itemNo); }

    @Override
    public int deleteTagRelation(int itemType, int itemNo) { return dao.deleteTagRelations(itemType, itemNo); }

}
