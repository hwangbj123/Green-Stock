package com.green.greenstock.utils;

import lombok.Data;

@Data
public class Pagination {

	private int totalCount;
	private int start;
	private int end;
	private int currentPage;
	private boolean nextPageGroup;
	private boolean prevPageGroup;
	private int currentPageGroup;
	private int startPageGroup;
	private int endPageGroup;
	
	// 한페이지에 글 10개, 페이지 그룹크기는 5
	public Pagination(int totalCount, int currentPage) {
		this.start = ((currentPage - 1) * 10) + 1;
		this.end = totalCount < (currentPage * 10) ? totalCount : (currentPage * 10);
		int blockCount = (int) Math.ceil(totalCount / 10.0); 
		this.nextPageGroup = (blockCount > 5) && (currentPage < blockCount);
		this.prevPageGroup =(blockCount > 5) && (currentPage > 5);
		this.currentPageGroup = (int)Math.ceil(currentPage / 5.0);
		this.startPageGroup = ((currentPageGroup - 1) * 5) + 1;
		this.endPageGroup = (blockCount / 10) < (currentPageGroup * 5) ? blockCount : (currentPageGroup * 5);
		this.totalCount = totalCount;
		this.currentPage = currentPage;
	}
	
}
