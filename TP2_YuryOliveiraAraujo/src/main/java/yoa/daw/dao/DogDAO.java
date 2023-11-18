package yoa.daw.dao;

import java.util.Base64;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import yoa.daw.model.Dog;
import yoa.daw.model.User;

public class DogDAO {
	EntityManager manager;

	public DogDAO() {
		manager = new JPAUtil().getEntityManager();
	}
	
	 @SuppressWarnings("unchecked")
	public List<Dog> findDogsByUser(User user) {
	        Query query = manager.createQuery("SELECT d FROM Dog d WHERE d.user = :user", Dog.class);
	        query.setParameter("user", user);
	        return query.getResultList();
	    }

	    public void encodeImagesAsBase64(List<Dog> dogs) {
	        for (Dog dog : dogs) {
	            String base64Image = Base64.getEncoder().encodeToString(dog.getImage());
	            dog.setBase64Image(base64Image);
	        }
	    }

}
