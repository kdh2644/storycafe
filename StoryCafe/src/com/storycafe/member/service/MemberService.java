package com.storycafe.member.service;

import com.storycafe.member.model.MemberDetailDto;
import com.storycafe.member.model.MemberDto;

public interface MemberService {

	int idCheck(String sid);
	int registerMember(MemberDetailDto memberDetailDto);
	MemberDto login(String mid, String mpass);
	void modifyUserInfo(MemberDto memberDto);
	void outOfUser(int mno);
}
