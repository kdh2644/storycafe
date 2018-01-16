package com.storycafe.admin.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.storycafe.admin.board.model.BoardListDto;
import com.storycafe.member.model.MemberDetailDto;

@Repository
public interface BoardAdminDao {
	List<BoardListDto> boardMenu();
	List<MemberDetailDto> cateList();
}
