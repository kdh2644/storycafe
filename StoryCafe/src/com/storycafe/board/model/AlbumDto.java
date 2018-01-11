package com.storycafe.board.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AlbumDto extends BoardDto {
	private int aseq;
	private String originPicture;
	private String savePicture;
	private String saveFolder;
	private int type;
	private List<MultipartFile> upfile;
	
	
	
	public List<MultipartFile> getUpfile() {
		return upfile;
	}
	public void setUpfile(List<MultipartFile> upfile) {
		this.upfile = upfile;
	}
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
	}
	public String getOriginPicture() {
		return originPicture;
	}
	public void setOriginPicture(String originPicture) {
		this.originPicture = originPicture;
	}
	public String getSavePicture() {
		return savePicture;
	}
	public void setSavePicture(String savePicture) {
		this.savePicture = savePicture;
	}
	public String getSaveFolder() {
		return saveFolder;
	}
	public void setSaveFolder(String saveFolder) {
		this.saveFolder = saveFolder;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
