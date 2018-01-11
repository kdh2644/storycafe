package com.storycafe.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storycafe.board.dao.MemoDao;
import com.storycafe.board.model.MemoDto;

@Service
public class MemoServiceImpl implements MemoService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeMemo(MemoDto memoDto) {
		MemoDao memoDao = sqlSession.getMapper(MemoDao.class);		
		memoDao.writeMemo(memoDto);
	}

	@Override
	public List<MemoDto> listMemo(int seq) {
		MemoDao memoDao = sqlSession.getMapper(MemoDao.class);		
		return memoDao.listMemo(seq);
	}

	@Override
	public void deleteMemo(int mseq) {
		MemoDao memoDao = sqlSession.getMapper(MemoDao.class);		
		memoDao.deleteMemo(mseq);
	}
}
