package com.example.service;

import java.util.List;

import com.example.model.NewsModel;
import com.example.paging.Pageable;

public interface INewsService {
	
	List<NewsModel> findAll();
	List<NewsModel> findAll(Pageable pageable);
	List<NewsModel> findByCategoryId(long categoryId);
	NewsModel findOne(long id);
	int getTotalItems();
	NewsModel save(NewsModel newsModel);
	NewsModel update(NewsModel newsModel);
	void delete(Long[] ids);

}
