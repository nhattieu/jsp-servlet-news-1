package com.example.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.example.dao.ICategoryDAO;
import com.example.model.CategoryModel;
import com.example.service.ICategoryService;

public class CategoryService implements ICategoryService {

	
	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<CategoryModel> findAll() {
		return categoryDAO.findAll();
	}

	@Override
	public CategoryModel findOne(long id) {
		return categoryDAO.findOne(id);
	}

	@Override
	public CategoryModel findOne(String code) {
		return categoryDAO.findOne(code);
	}

}
