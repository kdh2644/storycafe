package com.storycafe.board.service;

import java.util.List;

import com.storycafe.board.model.MemoDto;

public interface MemoService {

	void writeMemo(MemoDto memoDto);

	List<MemoDto> listMemo(int seq);

	void deleteMemo(int mseq);


}
