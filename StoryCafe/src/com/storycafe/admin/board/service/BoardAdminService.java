package com.storycafe.admin.board.service;

import java.util.List;

import com.storycafe.admin.board.model.BoardListDto;
import com.storycafe.member.model.MemberDetailDto;

public interface BoardAdminService {
	List<BoardListDto> boardMenu();

	List<MemberDetailDto> cateList();

}
