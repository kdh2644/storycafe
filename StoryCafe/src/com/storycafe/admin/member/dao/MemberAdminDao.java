package com.storycafe.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.storycafe.member.model.MemberDetailDto;

@Repository
public interface MemberAdminDao {
	List<MemberDetailDto> memberList(Map<String, String> map);
	int registerMember(MemberDetailDto memberDetailDto);
	int updateMemberCode(MemberDetailDto memberDetailDto);
	void deleteMember(int mno);
	void deleteMemberDetail(int mno);
}
