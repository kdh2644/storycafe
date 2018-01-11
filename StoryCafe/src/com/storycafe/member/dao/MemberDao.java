package com.storycafe.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.storycafe.member.model.MemberDetailDto;
import com.storycafe.member.model.MemberDto;

@Repository
public interface MemberDao {
	int idCheck(String sid);
	int registerMember(MemberDetailDto memberDetailDto);
	MemberDto login(Map<String, String> map);
	void modifyUserInfo(MemberDto memberDto);
	void outOfUser(int mno);
	void deleteMemo(int mno);
	void deleteBoard(int mno);
	void deleteReboard(int mno);
	void deleteAlbum(int mno);
	void deleteBbs(int mno);
}
