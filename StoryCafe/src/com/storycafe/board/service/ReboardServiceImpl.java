package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.storycafe.board.dao.ReboardDao;
import com.storycafe.board.model.ReboardDto;
import com.storycafe.common.dao.CommonDao;
import com.storycafe.util.BoardConstance;

@Service
public class ReboardServiceImpl implements ReboardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReboardDto> listArticle(Map<String, String> map) {
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.BOARD_LIST_SIZE * pg;
		int start = end - BoardConstance.BOARD_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");
		return reboardDao.listArticle(map);
	}

	@Override
	public int writeArticle(ReboardDto reboardDto) {
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
		return reboardDao.writeArticle(reboardDto);
	}

	@Override
	public ReboardDto viewArticle(int seq) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		commonDao.updateHit(seq);		
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
		return reboardDao.viewArticle(seq);
	}

	@Override
	public int modifyArticle(ReboardDto reboardDto) {
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
		return reboardDao.modifyArticle(reboardDto);
	}
	
	@Override
	@Transactional
	public void deleteArticle(int seq) {
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
		reboardDao.deleteReboard(seq);
		reboardDao.deleteArticle(seq);
	}

	@Override
	@Transactional
	public int replyArticle(ReboardDto reboardDto) {
		ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);	
		reboardDao.updateStep(reboardDto);
		reboardDao.replyArticle(reboardDto);
		reboardDao.updateReply(reboardDto.getPseq());
		
		return 1;
	}

}
