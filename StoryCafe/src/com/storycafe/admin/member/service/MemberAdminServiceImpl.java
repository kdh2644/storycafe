package com.storycafe.admin.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberAdminServiceImpl implements MemberAdminService{

	@Autowired
	private SqlSession sqlSession;
}
