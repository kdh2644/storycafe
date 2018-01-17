package com.storycafe.admin.board.service;

import java.util.List;

import com.storycafe.admin.board.model.BoardListDto;
import com.storycafe.admin.board.model.CategoryDto;
import com.storycafe.member.model.MemberDetailDto;

public interface BoardAdminService {
	List<BoardListDto> boardMenu();
	List<MemberDetailDto> cateList();
	List<MemberDetailDto> typeList();
	int cateinsert(CategoryDto categoryDto);
	List<MemberDetailDto> caList();
	int listinsert(BoardListDto boardListDto);
	void listdelete(BoardListDto boardListDto);

}
