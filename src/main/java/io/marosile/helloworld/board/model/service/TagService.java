package io.marosile.helloworld.board.model.service;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Tag;

public interface TagService {

	/** 태그 조회
	 * @param tagList
	 * @return List
	 */
	List<Tag> tagSelect(int boardNo);
	
	/** 태그 삽입
	 * @param tagList
	 * @return result
	 */
	int tagInsert(List<Tag> tagList);


}
