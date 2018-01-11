package com.storycafe.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface CommonDao {
	int getNextSeq();
	void updateHit(int seq);
	int getNewArticleCount(int bcode);
	int getTotalArticleCount(Map<String, String> map);
	int reboardCnt(int mno);
	int albumCnt(int mno);
	int bbsCnt(int mno);
}
