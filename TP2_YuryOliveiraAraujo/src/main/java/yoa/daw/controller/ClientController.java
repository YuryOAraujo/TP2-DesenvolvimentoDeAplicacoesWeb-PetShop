package yoa.daw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.DAO;
import yoa.daw.model.Dog;
import yoa.daw.model.User;

@Controller
public class ClientController {
	@RequestMapping("registerDogPage")
	public String registerDogPage() {
		return "client/registerDogPage";
	}
	
	@RequestMapping("registerDog")
	public String registerDog(Dog dog, HttpSession session) {
		User user = (User) session.getAttribute("logged");
		if(user != null) {
			dog.setUser(user);
			DAO<Dog> dao = new DAO<>(Dog.class);
			dao.add(dog);			
		}
		return "client/dashboard";
		
	}
	
	@RequestMapping("updateProfilePage")
	public String updateProfilePage() {
		return "client/updateProfilePage";
	}
	
	@RequestMapping("scheduleServicePage")
	public String scheduleServicePage() {
		return "client/scheduleServicePage";
	}
	
	@RequestMapping("listScheduleServicesPage")
	public String listScheduleServicesPage() {
		return "client/listScheduleServicesPage";
	}
	
	@RequestMapping("listPerformedServicesPage")
	public String listPerformedServicesPage() {
		return "client/listPerformedServicesPage";
	}
}
