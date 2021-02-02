package com.example.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.example.dao.INewsDAO;
import com.example.mapper.NewsMapper;
import com.example.model.NewsModel;
import com.example.paging.Pageable;

public class NewsDAO extends AbstractDAO<NewsModel> implements INewsDAO {

	public List<NewsModel> findByCategoryId(Long categoryId) {
		String sql = "SELECT * FROM news WHERE categoryid = ?";
		return query(sql, new NewsMapper(), categoryId);
	}

	@Override
	public Long save(NewsModel newsModel) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, ");
		sql.append("createddate, createdby) ");
		sql.append("VALUES ( ?, ?, ?, ?, ?, ?, ?)");

		return insert(sql.toString(), newsModel.getTitle(), newsModel.getThumbnail(), newsModel.getShortDescription(), 
				newsModel.getContent(), newsModel.getCategoryId(), 
				newsModel.getCreatedDate(), newsModel.getCreatedBy());
	}


	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM news WHERE id = ?";
		update(sql, id);
	}

	@Override
	public void update(NewsModel newsModel) {
		
		StringBuilder sql = new StringBuilder("UPDATE news ");
		sql.append("SET title = ?, thumbnail = ?, shortdescription = ?, content = ?, categoryid = ?, ");
		sql.append("createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? ");
		sql.append("WHERE id = ?");
		update(sql.toString(), newsModel.getTitle(), newsModel.getThumbnail(), newsModel.getShortDescription(), 
				newsModel.getContent(), newsModel.getCategoryId(), 
				newsModel.getCreatedDate(), newsModel.getCreatedBy(), newsModel.getModifiedDate(),
				newsModel.getModifiedBy(), newsModel.getId());
	}

	@Override
	public NewsModel findOne(Long id) {
		String sql = "SELECT * FROM news WHERE id = ?";
		List<NewsModel> list = query(sql, new NewsMapper(), id);
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public List<NewsModel> findAll() {
		String sql = "SELECT * FROM news";
		return query(sql, new NewsMapper());
	}

	@Override
	public int getTotalItems() {
		String sql = "SELECT COUNT(*) FROM news";
		return count(sql);
	}

	@Override
	public List<NewsModel> findAll(Pageable pageable) {
		StringBuilder sql = new StringBuilder("SELECT * FROM news");
		if(pageable.getSorter() != null && StringUtils.isNotBlank(pageable.getSorter().getSortName()) && StringUtils.isNotBlank(pageable.getSorter().getSortBy())) {
			sql.append(" ORDER BY " + pageable.getSorter().getSortName() + " " + pageable.getSorter().getSortBy());
		}
		
		if(pageable.getOffset() != null && pageable.getLimit() != null) {
			sql.append(" LIMIT " + pageable.getOffset() + ", " + pageable.getLimit());
		} 
		
		return query(sql.toString(), new NewsMapper());
		
	}
	



}
