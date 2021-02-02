package com.example.paging;

import com.example.sort.Sorter;

public class PageRequest implements Pageable {
	
	private Integer currentPage;
	private Integer pageItems;
	private Sorter sorter;
	
	public PageRequest(Integer currentPage, Integer pageItems, Sorter sorter) {
		this.currentPage = currentPage;
		this.pageItems = pageItems;
		this.sorter = sorter;
	}

	@Override
	public Integer getPage() {
		return this.currentPage;
	}

	@Override
	public Integer getOffset() {
		if(this.currentPage != null && this.pageItems != null) return (this.currentPage - 1) * this.pageItems;
		return null;
	}

	@Override
	public Integer getLimit() {
		return this.pageItems;
	}

	@Override
	public Sorter getSorter() {
		if(this.sorter != null) return this.sorter;
		return null;
	}

}
