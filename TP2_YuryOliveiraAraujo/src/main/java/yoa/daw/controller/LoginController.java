package yoa.daw.controller;

import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.DAO;
import yoa.daw.dao.UserDAO;
import yoa.daw.model.User;
import yoa.daw.utilities.EmailService;
import yoa.daw.utilities.PermissionEnum;
import yoa.daw.utilities.PermissionUtils;
import yoa.daw.utilities.UserConfirmedEnum;

@Controller
public class LoginController {
	@RequestMapping("loginForm")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping("login")
	public String login(User user, HttpSession session, RedirectAttributes redirectAttributes) {
		UserDAO userDAO = new UserDAO();
		if(userDAO.validate(user)) {
			user = userDAO.findByEmail(user.getEmail());
			session.setAttribute("logged", user);
			return String.format("redirect:%s", PermissionUtils.obtainDashboard(user.getPermission()));
		}
		redirectAttributes.addFlashAttribute("error", "Credenciais inválidas. Por favor, verifique seu e-mail e senha.");
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
	public String register(User user, RedirectAttributes redirectAttributes) {
		user.setPermission(PermissionEnum.USER);
		user.setConfirmed(UserConfirmedEnum.NOT_CONFIRMED);
		user.setConfirmationToken(UUID.randomUUID().toString());
		DAO<User> dao = new DAO<>(User.class);
		dao.add(user);
		EmailService.sendConfirmationEmail(user.getName(), user.getEmail(), user.getConfirmationToken());
		redirectAttributes.addFlashAttribute("success", "Usuário registrado, para entrar confirme seu email.");
		return "redirect:loginForm";
	}
	
	@RequestMapping("verifyEmail")
	public String verifyEmail(User user) {
		 User userDatabase = new UserDAO().findByToken(user.getConfirmationToken());

	    if (userDatabase != null)
	        if (userDatabase.getConfirmed() == UserConfirmedEnum.NOT_CONFIRMED) {
	            userDatabase.setConfirmed(UserConfirmedEnum.CONFIRMED);
	            DAO<User> dao = new DAO<>(User.class);
	            dao.update(userDatabase);
	            return "email/verified";
	        } 
	        else
	            return "email/alreadyVerified";
	    else
	       return "email/notFound";
	}
}
