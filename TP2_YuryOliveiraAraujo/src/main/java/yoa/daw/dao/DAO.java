package yoa.daw.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.criteria.CriteriaQuery;

public class DAO<T> {
	private Class<T> tClass;

	public DAO(Class<T> tClass) {
		this.tClass = tClass;
	}

	public void add(T t) {
		EntityManager manager = new JPAUtil().getEntityManager();

		manager.getTransaction().begin();
		manager.persist(t);
		manager.getTransaction().commit();
		manager.close();
	}

	public void update(T t) {
		EntityManager manager = new JPAUtil().getEntityManager();

		manager.getTransaction().begin();
		manager.merge(t);
		manager.getTransaction().commit();
		manager.close();
	}

	public void remove(T t) {
		EntityManager manager = new JPAUtil().getEntityManager();

		manager.getTransaction().begin();
		manager.remove(manager.merge(t));
		manager.getTransaction().commit();
		manager.close();
	}

	public T findById(Long id) {
		EntityManager manager = new JPAUtil().getEntityManager();
		return manager.find(tClass, id);
	}

	public List<T> list(){
		EntityManager manager = new JPAUtil().getEntityManager();
		CriteriaQuery<T> query = manager.getCriteriaBuilder().createQuery(tClass);
		query.select(query.from(tClass));
		List<T> list = manager.createQuery(query).getResultList();
		return list;
	}
}
