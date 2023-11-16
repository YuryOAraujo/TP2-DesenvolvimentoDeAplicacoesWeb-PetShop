package yoa.daw.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
	private static EntityManagerFactory manager = Persistence.createEntityManagerFactory("petshop");

	public EntityManager getEntityManager() {
		return manager.createEntityManager();
	}
}