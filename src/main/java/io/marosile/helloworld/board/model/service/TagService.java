package io.marosile.helloworld.board.model.service;

import java.util.List;
import java.util.Map;

import io.marosile.helloworld.board.model.dto.Tag;
import io.marosile.helloworld.recruit.model.dto.Recruit;

public interface TagService {

	/** 태그 조회
	 * @param tagList
	 * @return List
	 */
	List<Tag> tagSelect(Map<String, Object> map);
	
	/** 태그 삽입 - 일반 게시글
	 * @param tagList
	 * @return result
	 */
	int tagInsert(List<Tag> tagList);
	
	/** 태그 삽입 - 채용공고 게시글
	 * @param tagList
	 * @return
	 */
	int tagInsert2(List<Tag> tagList);

    /** 태그 수정
     * @param tagList
     * @return result
     */
    int tagUpdate(List<Tag> tagList);

	/** 매칭공고 태그들 가져오기
	 * @param rec
	 * @return List
	 */
	List<Tag> tagSelects2(Recruit rec);


}
