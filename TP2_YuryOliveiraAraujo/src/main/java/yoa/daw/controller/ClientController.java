package yoa.daw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.DAO;
import yoa.daw.dao.DogDAO;
import yoa.daw.model.Dog;
import yoa.daw.model.User;
import yoa.daw.utilities.PermissionUtils;

@Controller
public class ClientController {
	private boolean isAdmin(HttpSession session) {
		User user = (User) session.getAttribute("logged");
		return PermissionUtils.verifyPermission(user.getPermission());
	}
	
	@RequestMapping("registerDogPage")
	public String registerDogPage(HttpSession session) {
		if(isAdmin(session))
			return "staff/dashboard";
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
	
	@RequestMapping("client/dashboard")
	public String clientDashboard(Model model, HttpSession session) {
		if(isAdmin(session))
			return "staff/dashboard";
		
		User user = (User) session.getAttribute("logged");

	    if (user != null) {
	        DogDAO dogDAO = new DogDAO();
	        List<Dog> dogs = dogDAO.findDogsByUser(user);
	        model.addAttribute("dogs", dogs);
	        return "client/dashboard";
	    } else {
	        return "redirect:loginForm";
	    }
	}
	
	@RequestMapping("updateProfilePage")
	public String updateProfilePage(HttpSession session, Model model) {
		if(isAdmin(session))
			return "staff/dashboard";
		model.addAttribute("user", (User) session.getAttribute("logged"));
		return "client/updateProfilePage";
	}
	
	@RequestMapping("updateProfile")
	public String updateProfile(User user) {
		DAO<User> dao = new DAO<>(User.class);
		dao.update(user);
		return "client/dashboard";
	}
	
	@RequestMapping("scheduleServicePage")
	public String scheduleServicePage(HttpSession session) {
		if(isAdmin(session))
			return "staff/dashboard";
		return "client/scheduleServicePage";
	}
	
	@RequestMapping("listScheduleServicesPage")
	public String listScheduleServicesPage(HttpSession session) {
		if(isAdmin(session))
			return "staff/dashboard";
		return "client/listScheduleServicesPage";
	}
	
	@RequestMapping("listPerformedServicesPage")
	public String listPerformedServicesPage(HttpSession session) {
		if(isAdmin(session))
			return "staff/dashboard";
		return "client/listPerformedServicesPage";
	}
}
