package yoa.daw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.DAO;
import yoa.daw.model.Service;
import yoa.daw.model.User;
import yoa.daw.utilities.PermissionUtils;

@Controller
public class StaffController {
	private boolean isClient(HttpSession session) {
		User user = (User) session.getAttribute("logged");
		return !PermissionUtils.verifyPermission(user.getPermission());
	}
	
	@RequestMapping("staff-dashboard")
	public String dashboard(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/dashboard";
	}
	
	@RequestMapping("registerServicePage")
	public String registerServicePage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/registerServicePage";
	}
	
	@RequestMapping("registerService")
	public String registerService(Service service) {
		new DAO<Service>(Service.class).add(service);
		return "staff/dashboard";
	}
	
	@RequestMapping("updateServicePage")
	public String updateServicePage(HttpSession session, Model model) {
		if(isClient(session))
			return "client/dashboard";
		model.addAttribute("services", new DAO<Service>(Service.class).list());
		return "staff/updateServicePage";
	}
	
	@RequestMapping("displayService")
	public String displayService(Service service, Model model) {
		model.addAttribute("service", new DAO<Service>(Service.class).findById(service.getId()));
		return "staff/display";
	}
	
	@RequestMapping("updateService")
	public String updateService(Service service) {
		new DAO<Service>(Service.class).update(service);
		return "redirect:updateServicePage";
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
