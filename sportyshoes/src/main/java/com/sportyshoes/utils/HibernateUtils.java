package com.sportyshoes.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	public static SessionFactory getHibernateSessionFactory() {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		return factory;
	}

	public static Session getHibernateSession() {
		return getHibernateSessionFactory().openSession();
	}
}
