package yoa.daw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import yoa.daw.model.User;
import yoa.daw.utilities.PermissionUtils;

@Controller
public class StaffController {
	private boolean isClient(HttpSession session) {
		User user = (User) session.getAttribute("logged");
		return !PermissionUtils.verifyPermission(user.getPermission());
	}
	
	@RequestMapping("registerServicePage")
	public String registerServicePage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/registerServicePage";
	}
	
	@RequestMapping("updateServicePage")
	public String updateServicePage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/updateServicePage";
	}
	
	@RequestMapping("listServicesPage")
	public String listServicesPage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/listServicesPage";
	}
	
	@RequestMapping("performServicesPage")
	public String performServicesPage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/performServicesPage";
	}
	
	@RequestMapping("performedServicesReportPage")
	public String performedServicesReportPage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/performedServicesReportPage";
	}
}
