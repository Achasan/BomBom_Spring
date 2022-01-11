package com.bombom.model;

import lombok.Data;

@Data
public class TalkPagination {
	private int pageSize = 10;
	private int rangeSize = 5;
	private int currPage = 1;
	private int currRange = 1;
	private int listCount;
	private int pageCount;
	private int rangeCount;
	private int startPage = 1;
	private int endPage = 1;
	private int prevPage;
	private int nextPage;
	private int startIndex = 0;
	private int endIndex = 0;
	private int lastPage = 0;
	private String keyword = null;
	
	public TalkPagination(int listCount, int currPage) {
		setCurrPage(currPage);
		setListCount(listCount);
		setPageCount(listCount);
		setRangeCount(pageCount);
		rangeSetting(currPage);
		setStartIndex(currPage);
		setEndIndex(startIndex);
		setLastPage(listCount);
	}
	
	public void setPageCount(int listCount) {
		this.pageCount = (int)Math.ceil(listCount*1.0 / pageSize);
	}
	
	public void setRangeCount(int pageCount) {
		this.rangeCount = (int)Math.ceil(pageCount*1.0 / rangeSize);
	}
	
	public void rangeSetting(int currPage) {
		setCurrRange(currPage);
		
		this.startPage = (currRange - 1) * rangeSize + 1;
		this.endPage = startPage + rangeSize - 1;
		
		if(endPage > pageCount) {
			this.endPage = pageCount;
		}
		
		this.prevPage = currPage - 1;
		this.nextPage = currPage + 1;
	}
	
	public void setCurrRange(int currPage) {
		this.currRange = (int)((currPage - 1) / rangeSize) + 1;
	}
	
	public void setStartIndex(int currPage) {
		this.startIndex = (currPage - 1) * pageSize;
		
		if(startIndex == 0) startIndex = 1;
	}
	
	public void setEndIndex(int currPage) {
		this.endIndex = startIndex + pageSize;
	}
	
	public void setLastPage(int listCount) {
		this.lastPage = (int) Math.ceil(listCount*1.0 / pageSize);
	}
}
