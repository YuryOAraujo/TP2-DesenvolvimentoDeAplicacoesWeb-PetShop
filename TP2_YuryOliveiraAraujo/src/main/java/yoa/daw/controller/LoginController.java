package yoa.daw.controller;

import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.DAO;
import yoa.daw.dao.UserDAO;
import yoa.daw.model.User;
import yoa.daw.utilities.PermissionEnum;
import yoa.daw.utilities.UserConfirmedEnum;

@Controller
public class LoginController {
	@RequestMapping("loginForm")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping("login")
	public String login(User user, HttpSession session) {
		if(new UserDAO().validate(user)) {
			session.setAttribute("logged", user);
			return "redirect:listTasks";
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
	
	@RequestMapping("register")
	public String registerPage() {
		return "register";
	}
	
	@RequestMapping("registerForm")
	public String register(User user) {
		user.setPermission(PermissionEnum.USER);
		user.setConfirmed(UserConfirmedEnum.NOT_CONFIRMED);
		user.setConfirmationToken(UUID.randomUUID().toString());
		DAO<User> dao = new DAO<>(User.class);
		dao.add(user);
		return "loginForm";
	}
}
