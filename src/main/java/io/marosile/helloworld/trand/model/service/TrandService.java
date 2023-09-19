package io.marosile.helloworld.trand.model.service;

import java.util.List;

import io.marosile.helloworld.board.model.dto.Board;
import io.marosile.helloworld.trand.model.dto.Trand;

public interface TrandService {

	
	/** 트렌드 리스트 조회
	 * @param type
	 * @return
	 */
	List<Board> selectTagList(String type);

}
