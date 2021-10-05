package com.sportyshoes.utils;

import com.sportyshoes.dao.CategoryDao;
import com.sportyshoes.dao.ProductDao;
import com.sportyshoes.dao.PurchaseDao;
import com.sportyshoes.dao.UserDao;
import com.sportyshoes.model.Category;
import com.sportyshoes.model.Product;
import com.sportyshoes.model.Purchase;
import com.sportyshoes.model.User;
import com.sportyshoes.services.UserService;

public class Factory {	
	
public static UserDao getUserDao() {
	return new UserDao(User.class);
}
public static UserService getUserService() {
	return new UserService(getUserDao());
}
public static CategoryDao getCategoryDao() {
	return new CategoryDao(Category.class);
}
public static ProductDao getProductDao() {
	return new ProductDao(Product.class);
}
public static PurchaseDao getPurchaseDao() {
	return new PurchaseDao(Purchase.class);
}
}
