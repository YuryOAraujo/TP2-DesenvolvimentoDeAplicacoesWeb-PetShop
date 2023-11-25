package yoa.daw.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.StringJoiner;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import yoa.daw.dao.AppointmentDAO;
import yoa.daw.dao.DAO;
import yoa.daw.dao.DogDAO;
import yoa.daw.model.Appointment;
import yoa.daw.model.Dog;
import yoa.daw.model.Service;
import yoa.daw.model.User;
import yoa.daw.utilities.PermissionUtils;
import yoa.daw.utilities.StatusEnum;

@Controller
public class ClientController {
	private boolean isAdmin(HttpSession session) {
		User user = (User) session.getAttribute("logged");
		return PermissionUtils.verifyPermission(user.getPermission());
	}

	private String parseServices(List<Long> list) {
		StringJoiner joiner = new StringJoiner(",");
		for (Long id : list) {
			joiner.add(id.toString());
		}
		return joiner.toString();
	}
	
	private Appointment setFormattedDates(Appointment appointment) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.getDefault());
        if(appointment.getStatus() == StatusEnum.SCHEDULED)
        	appointment.setFormattedScheduleDate(appointment.getScheduleDate().format(formatter));
        
        if(appointment.getStatus() == StatusEnum.COMPLETED)
        	appointment.setFormattedPerformedDate(appointment.getPerformedDate().format(formatter));
        
        return appointment;
	}

	private List<Appointment> obtainAppointmentsByStatus(StatusEnum status, User user){
		List<Appointment> appointments = new AppointmentDAO().listAppointments(user, status);

		for(var appointment:appointments) {
			appointment.setServiceList(new ArrayList<Service>());
			if(status == StatusEnum.SCHEDULED)
				appointment.setCancelable(LocalDate.now().isBefore(appointment.getScheduleDate()));
			setFormattedDates(appointment);
			for(var service:appointment.getServices().split(",")) {
				appointment.getServiceList().add(new DAO<Service>(Service.class).findById(Long.parseLong(service)));
			}
		}		
		return appointments;
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
		return "redirect:/client-dashboard";
	}

	@RequestMapping("client-dashboard")
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
		return "redirect:client-dashboard";
	}

	@RequestMapping("scheduleServicePage")
	public String scheduleServicePage(HttpSession session, Model model) {
		if(isAdmin(session))
			return "staff/dashboard";
		User user = (User) session.getAttribute("logged");
		model.addAttribute("dogs", new DogDAO().findDogsByUser(user));
		model.addAttribute("services", new DAO<Service>(Service.class).list());
		return "client/scheduleServicePage";
	}

	@RequestMapping(value = "scheduleService")
	public String scheduleService(HttpSession session, @RequestParam Long dogId, @RequestParam(required = false) List<Long> list,
			@RequestParam("scheduleDate") @DateTimeFormat(pattern = "dd/MM/yyyy") LocalDate scheduleDate,
			RedirectAttributes redirectAttributes) {
		if(list == null) {
			redirectAttributes.addFlashAttribute("message", "Selecione pelo menos um serviço.");
			return "redirect:/scheduleServicePage";
		}

		if (new AppointmentDAO().hasAppointmentForDay(scheduleDate)) {
			redirectAttributes.addFlashAttribute("message", "Já existe um agendamento para este dia.");
			return "redirect:/scheduleServicePage";
		}

		Appointment appointment = new Appointment();
		appointment.setDog(new DAO<Dog>(Dog.class).findById(dogId));
		appointment.setScheduleDate(scheduleDate);
		appointment.setStatus(StatusEnum.SCHEDULED);
		appointment.setServices(parseServices(list));
		appointment.setUser((User) session.getAttribute("logged"));

		new DAO<Appointment>(Appointment.class).add(appointment);

		return "redirect:/client-dashboard";
	}

	@RequestMapping("listScheduleServicesPage")
	public String listScheduleServicesPage(HttpSession session, Model model) {
		if(isAdmin(session))
			return "staff/dashboard";
		User user = (User) session.getAttribute("logged");
		model.addAttribute("scheduleServices", obtainAppointmentsByStatus(StatusEnum.SCHEDULED, user));
		return "client/listScheduleServicesPage";
	}
	
	@ResponseBody
	@RequestMapping("cancelAppointment")
	public void removeAjax(Appointment appointment) {
		DAO<Appointment> dao = new DAO<>(Appointment.class);
		dao.remove(appointment);
	}

	@RequestMapping("listPerformedServicesPage")
	public String listPerformedServicesPage(HttpSession session, Model model) {
		if(isAdmin(session))
			return "staff/dashboard";
		User user = (User) session.getAttribute("logged");
		model.addAttribute("completedServices", obtainAppointmentsByStatus(StatusEnum.COMPLETED, user));
		return "client/listPerformedServicesPage";
	}
}
