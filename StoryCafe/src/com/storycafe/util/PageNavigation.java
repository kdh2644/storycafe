package com.storycafe.util;

public class PageNavigation {

	private String root;
	private boolean nowFirst;
	private boolean nowEnd;
	private int totalArticleCount;
	private int newArticleCount;
	private int totalPageCount;
	private int pageNo;
	private String navigator;
	private int bcode;
	private String key;
	private String word;

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public boolean isNowFirst() {
		return nowFirst;
	}

	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}

	public boolean isNowEnd() {
		return nowEnd;
	}

	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}

	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public int getNewArticleCount() {
		return newArticleCount;
	}

	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBcode() {
		return bcode;
	}

	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getNavigator() {
		return navigator;
	}

	public void setNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();

		int pageSize = BoardConstance.PAGE_SIZE;
		
		tmpNavigator.append("<div align=\"center\">");
		tmpNavigator.append("	<ul class=\"pagination\">");
		
		if (this.isNowFirst()) {
			tmpNavigator.append("<li class=\"disabled\"><a href=\"javascript:listArticle('" + bcode + "', '1', '', '');\"><i class=\"fa fa-angle-double-left\" aria-hidden=\"true\"></i></a></li>");
			tmpNavigator.append("<li class=\"disabled\"><a href=\"\"><i class=\"fa fa-angle-left\" aria-hidden=\"true\"></i></a></li>");
		} else {
			int prePage = (pageNo - 1) / pageSize * pageSize;
			tmpNavigator.append("<li><a href=\"javascript:listArticle('" + bcode + "', '1', '', '');\"><i class=\"fa fa-angle-double-left\" aria-hidden=\"true\"></i></a></li>");
			tmpNavigator.append("<li><a href=\"javascript:listArticle('" + bcode + "', '" + prePage + "', '" + key + "', '" + word + "');\"><i class=\"fa fa-angle-left\" aria-hidden=\"true\"></i></a></li>");			
		}

		
		int startPage = (pageNo - 1) / pageSize * pageSize + 1;
		int endPage = startPage + pageSize - 1;
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {
				tmpNavigator.append("<li class=\"active\"><a href=\"\"');\">" + i + "</a></li>");
			} else {
				tmpNavigator.append("<li><a href=\"javascript:listArticle('" + bcode + "', '" + i + "', '" + key + "', '" + word + "');\">" + i + "</a></li>");
			}
		}

		
		if (this.isNowEnd()) {
			tmpNavigator.append("<li class=\"disabled\"><a href=\"\"><i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i></a></li>");
			tmpNavigator.append("<li class=\"disabled\"><a href=\"\"><i class=\"fa fa-angle-double-right\" aria-hidden=\"true\"></i></a></li>");
		} else {
			int nextPage = (pageNo - 1) / pageSize * pageSize + pageSize + 1;//(pageNo + pageSize - 1) / pageSize * pageSize + 1
			tmpNavigator.append("<li><a href=\"javascript:listArticle('" + bcode + "', '" + nextPage + "', '" + key + "', '" + word + "');\"><i class=\"fa fa-angle-right\" aria-hidden=\"true\"></i></a></li>");
			tmpNavigator.append("<li><a href=\"javascript:listArticle('" + bcode + "', '" + totalPageCount + "', '" + key + "', '" + word + "');\"><i class=\"fa fa-angle-double-right\" aria-hidden=\"true\"></i></a></li>");
		}
		tmpNavigator.append("	</ul>");	
		tmpNavigator.append("</div>");

		this.navigator = tmpNavigator.toString();
	}

}
