package com.storycafe.common.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storycafe.common.dao.CommonDao;
import com.storycafe.util.BoardConstance;
import com.storycafe.util.PageNavigation;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getNextSeq() {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		return commonDao.getNextSeq();
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		
		int pg = Integer.parseInt(map.get("pg"));
		PageNavigation navigation = new PageNavigation();
		int pgSize = BoardConstance.PAGE_SIZE;
		navigation.setPageNo(pg);
		int newArticleCount = commonDao.getNewArticleCount(Integer.parseInt(map.get("bcode")));
		navigation.setNewArticleCount(newArticleCount);
		int totalArticleCount = commonDao.getTotalArticleCount(map);
		navigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / Integer.parseInt(map.get("listsize")) + 1;
		navigation.setTotalPageCount(totalPageCount);
		navigation.setNowFirst(pg <= pgSize);
		navigation.setNowEnd(pg > (totalPageCount - 1) / pgSize * pgSize);
		
		return navigation;
	}

	@Override
	public int reboardCnt(int mno) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		return commonDao.reboardCnt(mno);
	}

	@Override
	public int albumCnt(int mno) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		return commonDao.albumCnt(mno);
	}

	@Override
	public int bbsCnt(int mno) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		return commonDao.bbsCnt(mno);
	}
}
