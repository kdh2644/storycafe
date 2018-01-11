package com.storycafe.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.storycafe.board.model.BoardDto;

@Repository
public interface BoardDao {
	List<BoardDto> listArticle(Map<String, String> map);
	int writeArticle(BoardDto boardDto);
	BoardDto viewArticle(int seq);
	void deleteArticle(int seq);
	int modifyArticle(BoardDto boardDto);

}
