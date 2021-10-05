package com.sportyshoes.services;

import java.util.List;

import com.sportyshoes.dao.UserDao;
import com.sportyshoes.model.User;

public class UserService {
	private UserDao dao;

	public UserService(UserDao dao) {
		super();
		this.dao = dao;
	}
	
	public boolean isAuthenticated(String userName, String password) throws Exception {
		User user= dao.getItem(userName);
		if(user==null) {
			return false;
		}
		return user.getPassword().equals(password);
		
	}
	
	public void updatePassword(String userName, String newPwd) throws Exception {
		User user= dao.getItem(userName);
		if(user!=null) {
		user.setPassword(newPwd);
		dao.update(user);
		}
	}
	
	public List<User> getUsers(){
		return dao.getAll();
	}
	

}
