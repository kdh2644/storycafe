package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import com.storycafe.board.model.AlbumDto;

public interface AlbumService {

	List<AlbumDto> listArticle(Map<String, String> map);
	int writeArticle(AlbumDto albumDto);
	AlbumDto viewArticle(int seq);
	void deleteArticle(int seq);
	int modifyArticle(AlbumDto albumDto);

}
