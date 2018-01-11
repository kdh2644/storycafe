package com.storycafe.admin.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.storycafe.admin.board.model.BoardListDto;

@Repository
public interface BoardAdminDao {
	List<BoardListDto> boardMenu();
	List<BoardListDto> categoryList(int bcode);
}
