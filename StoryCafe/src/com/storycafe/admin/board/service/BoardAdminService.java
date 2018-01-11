package com.storycafe.admin.board.service;

import java.util.List;

import com.storycafe.admin.board.model.BoardListDto;

public interface BoardAdminService {
	List<BoardListDto> boardMenu();
	List<BoardListDto> categoryList(int bcode);

}
