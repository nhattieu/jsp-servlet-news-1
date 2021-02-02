package com.example.service;

import java.util.List;

import com.example.model.CategoryModel;

public interface ICategoryService {
	
	List<CategoryModel> findAll();
	CategoryModel findOne(long id);
	CategoryModel findOne(String code);

}