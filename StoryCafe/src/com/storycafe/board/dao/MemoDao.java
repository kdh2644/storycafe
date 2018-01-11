package com.storycafe.board.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.storycafe.board.model.MemoDto;

@Repository
public interface MemoDao {
	void writeMemo(MemoDto memoDto);
	List<MemoDto> listMemo(int seq);
	void deleteMemo(int mseq);
}
