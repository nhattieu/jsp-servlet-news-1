package com.example.dao;

import java.util.List;

import com.example.model.NewsModel;
import com.example.paging.Pageable;

public interface INewsDAO extends GenericDAO<NewsModel> {
	
	NewsModel findOne(Long id);
	List<NewsModel> findByCategoryId(Long categoryId);
	List<NewsModel> findAll();
	List<NewsModel> findAll(Pageable pageable);
	Long save(NewsModel newsModel);
	void update(NewsModel newsModel);
	void delete(Long id);
	int getTotalItems();

}
