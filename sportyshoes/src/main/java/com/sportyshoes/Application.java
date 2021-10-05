package com.sportyshoes;

import com.sportyshoes.utils.HibernateUtils;

public class Application {

	public static void main(String[] args) {
		HibernateUtils.getHibernateSessionFactory();

	}

}
