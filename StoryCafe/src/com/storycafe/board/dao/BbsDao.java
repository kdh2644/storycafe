package com.storycafe.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.storycafe.board.model.BbsDto;

@Repository
public interface BbsDao {

	List<BbsDto> listArticle(Map<String, String> map);
	int writeArticle(BbsDto bbsDto);
	BbsDto viewArticle(int seq);
	BbsDto filePathInfo(int bseq);

}
