package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storycafe.board.dao.BbsDao;
import com.storycafe.board.model.BbsDto;
import com.storycafe.common.dao.CommonDao;
import com.storycafe.util.BoardConstance;

@Service
public class BbsServiceImpl implements BbsService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BbsDto> listArticle(Map<String, String> map) {
		BbsDao bbsDao = sqlSession.getMapper(BbsDao.class);
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");
		return bbsDao.listArticle(map);
	}

	@Override
	public int writeArticle(BbsDto bbsDto) {
		BbsDao bbsDao = sqlSession.getMapper(BbsDao.class);
		return bbsDao.writeArticle(bbsDto);
	}

	@Override
	public BbsDto viewArticle(int seq) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		commonDao.updateHit(seq);	
		BbsDao bbsDao = sqlSession.getMapper(BbsDao.class);
		return bbsDao.viewArticle(seq);
	}

	@Override
	public BbsDto filePathInfo(int bseq) {
		BbsDao bbsDao = sqlSession.getMapper(BbsDao.class);
		return bbsDao.filePathInfo(bseq);
	}
}
