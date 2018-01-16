package com.storycafe.admin.member.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.storycafe.admin.member.dao.MemberAdminDao;
import com.storycafe.member.model.MemberDetailDto;
import com.storycafe.util.BoardConstance;

@Service
public class MemberAdminServiceImpl implements MemberAdminService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDetailDto> memberList(Map<String, String> map) {
		MemberAdminDao memberAdminDao = sqlSession.getMapper(MemberAdminDao.class);
		
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.MEMBER_LIST_SIZE * pg;
		int start = end - BoardConstance.MEMBER_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");			
		
		return memberAdminDao.memberList(map);
	}

	@Override
	public int registerMember(MemberDetailDto memberDetailDto) {
		MemberAdminDao memberAdminDao = sqlSession.getMapper(MemberAdminDao.class);
		return memberAdminDao.registerMember(memberDetailDto);
	}

	@Override
	public int updateMemberCode(MemberDetailDto memberDetailDto) {
		MemberAdminDao memberAdminDao = sqlSession.getMapper(MemberAdminDao.class);
		return memberAdminDao.updateMemberCode(memberDetailDto);
	}

	@Override
	@Transactional
	public void deleteMember(int mno) {
		MemberAdminDao memberAdminDao = sqlSession.getMapper(MemberAdminDao.class);
		memberAdminDao.deleteMemberDetail(mno);
		memberAdminDao.deleteMember(mno);
	}

}
