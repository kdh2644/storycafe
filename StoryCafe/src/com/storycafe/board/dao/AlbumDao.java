package com.storycafe.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.storycafe.board.model.AlbumDto;

@Repository
public interface AlbumDao {
	List<AlbumDto> listArticle(Map<String, String> map);
	int writeArticle(AlbumDto albumDto);
	AlbumDto viewArticle(int seq);
	void deleteAlbum(int seq);
	void deleteArticle(int seq);
	int modifyArticle(AlbumDto albumDto);
	void modifyPhoto(AlbumDto albumDto);

}
