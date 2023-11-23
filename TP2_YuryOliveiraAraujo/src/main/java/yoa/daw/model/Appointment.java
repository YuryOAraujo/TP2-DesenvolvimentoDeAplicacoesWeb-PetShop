package yoa.daw.model;

import java.time.LocalDate;
import java.util.List;

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
import jakarta.persistence.Transient;
import yoa.daw.utilities.StatusEnum;

@Entity
@Table(name = "appointments")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "schedule_date", nullable = false)
	private LocalDate scheduleDate;
	
	@Column(name = "services", nullable = false)
	private String services;
	
	@ManyToOne
	@JoinColumn(name = "dog_id", nullable = false)
	private Dog dog;
	
	@Enumerated(EnumType.STRING)
	private StatusEnum status;
	
	@Column(name = "performed_date")
	private LocalDate performedDate;
	
	@Column(name = "total")
	private Double total; 

	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	@Transient
	private List<Service> serviceList;
	
	@Transient
	private boolean cancelable;
	
	@Transient
	private String formattedScheduleDate;
	
	@Transient
	private String formattedPerformedDate;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public LocalDate getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(LocalDate scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public String getServices() {
		return services;
	}

	public void setServices(String services) {
		this.services = services;
	}

	public LocalDate getPerformedDate() {
		return performedDate;
	}

	public void setPerformedDate(LocalDate performedDateTime) {
		this.performedDate = performedDateTime;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Service> getServiceList() {
		return serviceList;
	}

	public void setServiceList(List<Service> serviceList) {
		this.serviceList = serviceList;
	}

	public boolean isCancelable() {
		return cancelable;
	}

	public void setCancelable(boolean cancelable) {
		this.cancelable = cancelable;
	}

	public String getFormattedScheduleDate() {
		return formattedScheduleDate;
	}

	public void setFormattedScheduleDate(String formattedScheduleDate) {
		this.formattedScheduleDate = formattedScheduleDate;
	}

	public String getFormattedPerformedDate() {
		return formattedPerformedDate;
	}

	public void setFormattedPerformedDate(String formattedPerformedDate) {
		this.formattedPerformedDate = formattedPerformedDate;
	}
}
