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

}
