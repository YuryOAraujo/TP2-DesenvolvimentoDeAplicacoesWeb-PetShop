package yoa.daw.dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import yoa.daw.model.User;
import yoa.daw.utilities.UserConfirmedEnum;

public class UserDAO {
	EntityManager manager;

	public UserDAO() {
		manager = new JPAUtil().getEntityManager();
	}
	
	public boolean validate(User user) {
	    if (user == null)
	        throw new IllegalArgumentException("User shouldn't be null");

	    Query query = manager.createQuery("SELECT u FROM User u WHERE u.email = :email AND u.password = :password AND u.confirmed = :confirmed", User.class);
	    query.setParameter("email", user.getEmail());
	    query.setParameter("password", user.getPassword());
	    query.setParameter("confirmed", UserConfirmedEnum.CONFIRMED);

	    @SuppressWarnings("unchecked")
	    List<User> users = query.getResultList();
	    return !users.isEmpty();
	}
	
	public User findByToken(String token) {
		Query query = manager.createQuery(
                "SELECT u FROM User u WHERE u.confirmationToken = :token", User.class);
        query.setParameter("token", token);
        @SuppressWarnings("unchecked")
		List<User> resultList = query.getResultList();
        return resultList.isEmpty() ? null : resultList.get(0);
	}
	
	public User findByEmail(String email) {
		Query query = manager.createQuery(
                "SELECT u FROM User u WHERE u.email = :email", User.class);
        query.setParameter("email", email);
        @SuppressWarnings("unchecked")
		List<User> resultList = query.getResultList();
        return resultList.isEmpty() ? null : resultList.get(0);
	}

}
