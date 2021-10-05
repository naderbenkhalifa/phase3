package com.sportyshoes.dao;

import com.sportyshoes.model.Purchase;

public class PurchaseDao extends GenericDao<Purchase, Integer> {

	public PurchaseDao(Class<Purchase> type) {
		super(type);
	}

}
