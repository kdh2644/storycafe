package com.storycafe.member.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.storycafe.member.dao.MemberDao;
import com.storycafe.member.model.MemberDetailDto;
import com.storycafe.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String sid) {
		// TODO Auto-generated method stub
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		return memberDao.idCheck(sid);
	}

	@Override
	public int registerMember(MemberDetailDto memberDetailDto) {
		// TODO Auto-generated method stub
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);

		return memberDao.registerMember(memberDetailDto);
	}

	@Override
	public MemberDto login(String mid, String mpass) {
		// TODO Auto-generated method stub
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		Map<String, String> map = new HashMap<String, String>();
	
		map.put("userid", mid);
		map.put("userpass", mpass);
		
		return memberDao.login(map);
	}

	@Override
	public void modifyUserInfo(MemberDto memberDto) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.modifyUserInfo(memberDto);
	}

	@Override
	@Transactional
	public void outOfUser(int mno) {
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		memberDao.deleteMemo(mno);
		memberDao.deleteReboard(mno);
		memberDao.deleteAlbum(mno);
		memberDao.deleteBbs(mno);
		memberDao.deleteBoard(mno);
		memberDao.outOfUser(mno);
	}

}
