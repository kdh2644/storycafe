package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import com.storycafe.board.model.BbsDto;

public interface BbsService {

	List<BbsDto> listArticle(Map<String, String> map);
	int writeArticle(BbsDto bbsDto);
	BbsDto viewArticle(int seq);
	BbsDto filePathInfo(int bseq);

}
