package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import com.storycafe.board.model.ReboardDto;

public interface ReboardService {
	List<ReboardDto> listArticle(Map<String, String> map);
	int writeArticle(ReboardDto reboardDto);
	ReboardDto viewArticle(int seq);
	int modifyArticle(ReboardDto reboardDto);
	void deleteArticle(int seq);
	int replyArticle(ReboardDto reboardDto);
}
