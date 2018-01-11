package com.storycafe.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.storycafe.board.model.ReboardDto;

@Repository
public interface ReboardDao {
	List<ReboardDto> listArticle(Map<String, String> map);
	int writeArticle(ReboardDto reboardDto);
	ReboardDto viewArticle(int seq);
	int modifyArticle(ReboardDto reboardDto);
	void deleteArticle(int seq);
	void deleteReboard(int seq);
	int replyArticle(ReboardDto reboardDto);
	void updateStep(ReboardDto reboardDto);
	void updateReply(int pseq);

}
