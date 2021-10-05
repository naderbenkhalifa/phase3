package com.sportyshoes.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.sportyshoes.utils.HibernateUtils;

public class GenericDao<T,PK extends Serializable> {
	private Class<T> type;

    public GenericDao(Class<T> type) {
        this.type = type;
    }
	public T getItem(PK id) throws Exception {
		Session session = null;
		T item =null;
		try {
			session = HibernateUtils.getHibernateSession();
			item = session.get(type, id);
		} catch (Exception e) {
			throw e;
		} finally {
			if (session != null)
				session.close();
		}
		return item;
	}
	
	public void update(T updatedItem) {
		Session session = null;
		try {
			session = HibernateUtils.getHibernateSession();
			session.beginTransaction();
			
			session.update(updatedItem);
			System.out.println("update:success");
			session.getTransaction().commit();

		} catch (Exception e) {
			System.out.println("update:Error: ");
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	
	public List<T> getAll() {
		List<T> result = null;
		Session session = null;
		try {
			String queryStr=String.format("Select e from %s e", type.getName());
			System.out.println("getAll:queryStr : "+queryStr);
			session = HibernateUtils.getHibernateSession();
			Query<T> query = session.createQuery(queryStr, type);
			result = query.getResultList();
		} catch (Exception e) {
			System.out.println("getAll:Error: ");
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return result;
	}
	public void delete(Integer id) {
		Session session = null;
		try {
			session = HibernateUtils.getHibernateSession();

			System.out.println("delete: id " + id);
			T  item = session.get(type, id);
			if (item != null) {
				session.beginTransaction();
				session.delete(item);
				session.getTransaction().commit();
				System.out.println("delete:success");
			}

		} catch (Exception e) {
			System.out.println("delete:Error: ");
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public void add(T newItem) {
		Session session = null;
		try {
			session = HibernateUtils.getHibernateSession();
			session.beginTransaction();
			
			session.persist(newItem);
			System.out.println("add: SUCCESS");
			session.getTransaction().commit();
			

		} catch (Exception e) {
			System.out.println("ADD:Error: ");
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}


	

}
