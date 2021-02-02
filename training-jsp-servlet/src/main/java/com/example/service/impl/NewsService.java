package com.example.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.example.dao.ICategoryDAO;
import com.example.dao.INewsDAO;
import com.example.dao.impl.NewsDAO;
import com.example.model.CategoryModel;
import com.example.model.NewsModel;
import com.example.paging.Pageable;
import com.example.service.INewsService;

public class NewsService implements INewsService {

	@Inject
	private INewsDAO newsDAO;
	
	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<NewsModel> findByCategoryId(long categoryId) {
		return newsDAO.findByCategoryId(categoryId);
	}

	@Override
	public NewsModel save(NewsModel newsModel) {
		CategoryModel categoryModel = categoryDAO.findOne(newsModel.getCategoryCode());
		newsModel.setCategoryId(categoryModel.getId());
		newsModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		
		Long newsId = newsDAO.save(newsModel);
		return newsDAO.findOne(newsId);
	}

	@Override
	public NewsModel update(NewsModel newsModel) {
		NewsModel oldNews = newsDAO.findOne(newsModel.getId());
		newsModel.setCreatedDate(oldNews.getCreatedDate());
		newsModel.setCreatedBy(oldNews.getCreatedBy());
		newsModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		
		CategoryModel categoryModel = categoryDAO.findOne(newsModel.getCategoryCode());
		newsModel.setCategoryId(categoryModel.getId());
		
		newsDAO.update(newsModel);
		return newsDAO.findOne(newsModel.getId());
	}

	@Override
	public void delete(Long[] ids) {
		for(Long id : ids) newsDAO.delete(id);
		System.out.println("Successfully!");
	}

	@Override
	public List<NewsModel> findAll() {
		return newsDAO.findAll();
	}

	@Override
	public int getTotalItems() {
		return newsDAO.getTotalItems();
	}

	@Override
	public List<NewsModel> findAll(Pageable pageable) {
		return newsDAO.findAll(pageable);
	}

	@Override
	public NewsModel findOne(long id) {
		NewsModel newsModel = newsDAO.findOne(id);
		CategoryModel categoryModel = categoryDAO.findOne(newsModel.getCategoryId());
		newsModel.setCategoryCode(categoryModel.getCode());
		return newsModel;
	}
	
}
