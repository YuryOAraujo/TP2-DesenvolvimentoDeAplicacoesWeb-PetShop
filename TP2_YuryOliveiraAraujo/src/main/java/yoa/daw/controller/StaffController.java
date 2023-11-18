package yoa.daw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaffController {
	@RequestMapping("registerServicePage")
	public String registerServicePage() {
		return "staff/registerServicePage";
	}
	
	@RequestMapping("updateServicePage")
	public String updateServicePage() {
		return "staff/updateServicePage";
	}
	
	@RequestMapping("listServicesPage")
	public String listServicesPage() {
		return "staff/listServicesPage";
	}
	
	@RequestMapping("performServicesPage")
	public String performServicesPage() {
		return "staff/performServicesPage";
	}
	
	@RequestMapping("performedServicesReportPage")
	public String performedServicesReportPage() {
		return "staff/performedServicesReportPage";
	}
}
