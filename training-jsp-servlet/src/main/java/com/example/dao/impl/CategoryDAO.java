package com.example.dao.impl;

import java.util.List;

import com.example.dao.ICategoryDAO;
import com.example.mapper.CategoryMapper;
import com.example.mapper.NewsMapper;
import com.example.model.CategoryModel;
import com.example.model.NewsModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());

	}

	@Override
	public CategoryModel findOne(long id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		List<CategoryModel> list = query(sql, new CategoryMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public CategoryModel findOne(String code) {
		String sql = "SELECT * FROM category WHERE code = ?";
		List<CategoryModel> list = query(sql, new CategoryMapper(), code);
		return list.isEmpty() ? null : list.get(0);
	}
	
	
	

}
