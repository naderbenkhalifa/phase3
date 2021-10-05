package com.sportyshoes.dao;

import com.sportyshoes.model.User;

public class UserDao extends GenericDao<User,String>{

	public UserDao(Class<User> type) {
		super(type);
	}
}
