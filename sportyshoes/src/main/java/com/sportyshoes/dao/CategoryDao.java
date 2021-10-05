package com.sportyshoes.dao;

import com.sportyshoes.model.Category;

public class CategoryDao extends GenericDao<Category,Integer>{

	public CategoryDao(Class<Category> type) {
		super(type);
	}

}
