package com.storycafe.admin.member.service;

import java.util.List;
import java.util.Map;

import com.storycafe.member.model.MemberDetailDto;

public interface MemberAdminService {
	List<MemberDetailDto> memberList(Map<String, String> map);
	int registerMember(MemberDetailDto memberDetailDto);
	int updateMemberCode(MemberDetailDto memberDetailDto);
	void deleteMember(int mno);

}
