package yoa.daw.dao;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import yoa.daw.model.Appointment;
import yoa.daw.model.User;
import yoa.daw.utilities.StatusEnum;

public class AppointmentDAO {
	EntityManager manager;

	public AppointmentDAO() {
		manager = new JPAUtil().getEntityManager();
	}
	
	public boolean hasAppointmentForDay(LocalDate scheduleDate) {
        Query query = manager.createQuery("SELECT COUNT(a) FROM Appointment a WHERE a.scheduleDate = :scheduleDate", 
                Long.class);
        query.setParameter("scheduleDate", scheduleDate);

        return (Long) query.getSingleResult() > 0;
    }

	@SuppressWarnings("unchecked")
	public List<Appointment> listAppointments(User user, StatusEnum status) {
	    Query query = manager.createQuery("SELECT a FROM Appointment a WHERE a.user = :user AND a.status = :status", Appointment.class);
	    query.setParameter("user", user);
	    query.setParameter("status", status);
	    return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Appointment> listAppointmentsAfterDate(StatusEnum status, LocalDate startDate) {
	    Query query = manager.createQuery("SELECT a FROM Appointment a WHERE a.status = :status AND a.scheduleDate > :startDate", Appointment.class);
	    query.setParameter("status", status);
	    query.setParameter("startDate", startDate);
	    return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Appointment> listAppointmentsFromAllUsers(StatusEnum status) {
	    Query query = manager.createQuery("SELECT a FROM Appointment a WHERE a.status = :status", Appointment.class);
	    query.setParameter("status", status);
	    return query.getResultList();
	}
}
