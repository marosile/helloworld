package io.marosile.helloworld.board.model.service;

import java.util.List;

public interface TagService {

	/** 태그 삽입
	 * @param tags
	 * @return result
	 */
	int insertTags(List<String> tags);

}
