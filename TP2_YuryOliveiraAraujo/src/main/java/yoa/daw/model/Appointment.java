package yoa.daw.model;

import java.util.Calendar;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import yoa.daw.utilities.StatusEnum;

@Entity
@Table(name = "appointments")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "schedule_date", nullable = false)
	private Calendar scheduleDate;
	
	@ManyToOne
	@JoinColumn(name = "service_id", nullable = false)
	private Service service;
	
	@ManyToOne
	@JoinColumn(name = "dog_id", nullable = false)
	private Dog dog;
	
	@Enumerated(EnumType.STRING)
	private StatusEnum status;
	
	@Column(name = "performed_date")
	private Calendar performedDateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Calendar getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Calendar scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public Service getService() {
		return service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}

	public StatusEnum getStatus() {
		return status;
	}

	public void setStatus(StatusEnum status) {
		this.status = status;
	}

	public Calendar getPerformedDateTime() {
		return performedDateTime;
	}

	public void setPerformedDateTime(Calendar performedDateTime) {
		this.performedDateTime = performedDateTime;
	}
}
