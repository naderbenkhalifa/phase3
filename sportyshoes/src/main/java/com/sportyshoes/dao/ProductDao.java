package com.sportyshoes.dao;

import com.sportyshoes.model.Product;

public class ProductDao extends GenericDao<Product,Integer>{

	public ProductDao(Class<Product> type) {
		super(type);
	}

}
