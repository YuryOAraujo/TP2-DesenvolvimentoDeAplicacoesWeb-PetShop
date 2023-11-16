package yoa.daw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.UserDAO;
import yoa.daw.model.User;

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
}
