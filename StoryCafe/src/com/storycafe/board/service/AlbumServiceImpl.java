package com.storycafe.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.storycafe.board.dao.AlbumDao;
import com.storycafe.board.model.AlbumDto;
import com.storycafe.common.dao.CommonDao;
import com.storycafe.util.BoardConstance;

@Service
public class AlbumServiceImpl implements AlbumService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AlbumDto> listArticle(Map<String, String> map) {
		// TODO Auto-generated method stub
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		int pg = Integer.parseInt(map.get("pg"));
		int end = BoardConstance.ALBUM_LIST_SIZE * pg;
		int start = end - BoardConstance.ALBUM_LIST_SIZE;
		map.put("start", start + "");
		map.put("end", end + "");
		return albumDao.listArticle(map);
	}

	@Override
	public int writeArticle(AlbumDto albumDto) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		return albumDao.writeArticle(albumDto);
	}

	@Override
	public AlbumDto viewArticle(int seq) {
		CommonDao commonDao = sqlSession.getMapper(CommonDao.class);
		commonDao.updateHit(seq);	
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		return albumDao.viewArticle(seq);
	}

	@Override
	@Transactional
	public void deleteArticle(int seq) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		albumDao.deleteAlbum(seq);
		albumDao.deleteArticle(seq);		
	}

	@Override
	public int modifyArticle(AlbumDto albumDto) {
		AlbumDao albumDao = sqlSession.getMapper(AlbumDao.class);
		albumDao.modifyPhoto(albumDto);
		return albumDao.modifyArticle(albumDto);
	}
}
