package yoa.daw.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.AppointmentDAO;
import yoa.daw.dao.DAO;
import yoa.daw.model.Appointment;
import yoa.daw.model.Service;
import yoa.daw.model.User;
import yoa.daw.utilities.PermissionUtils;
import yoa.daw.utilities.StatusEnum;

@Controller
public class StaffController {
	private boolean isClient(HttpSession session) {
		User user = (User) session.getAttribute("logged");
		return !PermissionUtils.verifyPermission(user.getPermission());
	}
	
	private List<Service> obtainServices(Appointment appointment){
		List<Service> services = new ArrayList<Service>();
		for(var service:appointment.getServices().split(",")) {
			services.add(new DAO<Service>(Service.class).findById(Long.parseLong(service)));
		}
		return services;
	}
	
	private void parseAppointmentList(List<Appointment> appointments){
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.getDefault());
		for(var appointment:appointments) {
			appointment.setFormattedScheduleDate(appointment.getScheduleDate().format(formatter));
			appointment.setServiceList(obtainServices(appointment));
		}
	}
	
	private Double appointmentTotal(List<Service> serviceList) {
		double total = 0;
		
		for(var service:serviceList)
			total += service.getPrice().doubleValue();
				
		if(serviceList.size() >= 3)
			total = total - (total / 10);
		
		return total;
	}
	
	@RequestMapping("staff-dashboard")
	public String dashboard(Model model, HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		
		model.addAttribute("services", new DAO<Service>(Service.class).list());
		
		return "staff/dashboard";
	}
	
	@RequestMapping("registerServicePage")
	public String registerServicePage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/registerServicePage";
	}
	
	@RequestMapping("registerService")
	public String registerService(Service service, RedirectAttributes redirectAttributes) {
		new DAO<Service>(Service.class).add(service);
		redirectAttributes.addFlashAttribute("success", "Serviço cadastrado com sucesso.");
		return "redirect:staff-dashboard";
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
	public String updateService(Service service, RedirectAttributes redirectAttributes) {
		new DAO<Service>(Service.class).update(service);
		redirectAttributes.addFlashAttribute("success", "Serviço atualizado com sucesso.");
		return "redirect:updateServicePage";
	}
	
	@RequestMapping("listServicesPage")
	public String listServicesPage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/listServicesPage";
	}
	
	@RequestMapping("listAppointments")
	public String listAppointmentsFromDate(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate, Model model, HttpSession session) {
		if(session.getAttribute("logged") != null) {
			List<Appointment> appointments = new AppointmentDAO().listAppointmentsAfterDate(StatusEnum.SCHEDULED, startDate);
			parseAppointmentList(appointments);
			model.addAttribute("appointments", appointments);
		    return "staff/scheduleAppointmentsTable";
		}
		return "login";
	}

	@RequestMapping("performServicesPage")
	public String performServicesPage(HttpSession session, Model model) {
		if(isClient(session))
			return "client/dashboard";
		List<Appointment> appointments = new AppointmentDAO().listAppointmentsFromAllUsers(StatusEnum.SCHEDULED);
		parseAppointmentList(appointments);
		model.addAttribute("appointments", appointments);
		return "staff/performServicesPage";
	}
	
	@RequestMapping("performAppointment")
	public String display(Appointment appointment, Model model) {
		DAO<Appointment> appointmentDAO = new DAO<>(Appointment.class);
		List<Appointment> appointments = new ArrayList<>();
		appointments.add(appointmentDAO.findById(appointment.getId()));
		parseAppointmentList(appointments);
		appointment = appointments.get(0);
		appointment.setTotal(appointmentTotal(appointment.getServiceList()));
		model.addAttribute("appointment", appointment);
		return "staff/perform";
	}

	@RequestMapping("performService")
	public String performService(Appointment performed) {
		DAO<Appointment> appointmentDAO = new DAO<>(Appointment.class);
		Appointment appointment = appointmentDAO.findById(performed.getId());
		appointment.setTotal(performed.getTotal());
		appointment.setPerformedDate(performed.getPerformedDate());	    
		appointment.setStatus(StatusEnum.COMPLETED);
		appointmentDAO.update(appointment);
	    return "redirect:performServicesPage";
	}

	
	@RequestMapping("performedServicesReportPage")
	public String performedServicesReportPage(HttpSession session) {
		if(isClient(session))
			return "client/dashboard";
		return "staff/performedServicesReportPage";
	}
	
	@RequestMapping("displayReport")
	public String displayReport(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate startDate,
			@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate endDate,
			Model model, HttpSession session) {
		if(session.getAttribute("logged") != null) {
			List<Appointment> appointments = new AppointmentDAO().listAppointmentsBetweenDates(StatusEnum.COMPLETED, startDate, endDate);
			double total = 0;
			parseAppointmentList(appointments);
			
			for(var appointment:appointments) {
				appointment.setFormattedPerformedDate(appointment.getPerformedDate().format(DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.getDefault())));
				total += appointment.getTotal();
			}
			
			model.addAttribute("appointments", appointments);
			model.addAttribute("total", total);
			return "staff/scheduleAppointmentsTable";
		}
		return "login";
	}
}
