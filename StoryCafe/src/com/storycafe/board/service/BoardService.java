package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import com.storycafe.board.model.BoardDto;

public interface BoardService {

	List<BoardDto> listArticle(Map<String, String> map);

	int writeArticle(BoardDto boardDto);
	BoardDto viewArticle(int seq);
	void deleteArticle(int seq);
	int modifyArticle(BoardDto boardDto);

}
