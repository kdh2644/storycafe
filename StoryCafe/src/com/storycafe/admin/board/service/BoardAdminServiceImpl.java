package com.storycafe.admin.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storycafe.admin.board.dao.BoardAdminDao;
import com.storycafe.admin.board.model.BoardListDto;
import com.storycafe.member.model.MemberDetailDto;

@Service
public class BoardAdminServiceImpl implements BoardAdminService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardListDto> boardMenu() {
		// TODO Auto-generated method stub
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		return boardAdminDao.boardMenu();
	}

	@Override
	public List<MemberDetailDto> cateList() {
		BoardAdminDao boardAdminDao = sqlSession.getMapper(BoardAdminDao.class);
		return boardAdminDao.cateList();
	}



}
