package io.marosile.helloworld.tag.model.service;

import java.util.List;

public interface TagService {

    List<String> selectTagList();

    int insertTagList(List<String> tags);

    int insertTagRelation(String tag, int itemType, int itemNo);

    int deleteTagRelation(String tag, int itemType, int itemNo);

    int deleteTagRelation(int itemType, int itemNo);

}
