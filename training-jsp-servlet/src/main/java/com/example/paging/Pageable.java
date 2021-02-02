package com.example.paging;

import com.example.sort.Sorter;

public interface Pageable {
	
	Integer getPage();
	Integer getOffset();
	Integer getLimit();
	Sorter getSorter();

}
