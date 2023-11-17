package yoa.daw.model;

import java.util.Calendar;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import yoa.daw.utilities.PermissionEnum;
import yoa.daw.utilities.UserConfirmedEnum;

@Entity
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	private String login;
	@Column(nullable = false)
	private String cpf;
	@Column(nullable = false)
	private String name;
	@Column(name = "birth_date", nullable = false)
	private Calendar birthDate;
	@Column(nullable = false)
	private String email;
	@Column(nullable = false)
	private String password;
	private String phone;
	@Enumerated(EnumType.STRING)
	private PermissionEnum permission;
	@Enumerated(EnumType.STRING)
	private UserConfirmedEnum confirmed;
	@Column(name = "confirmation_token")
	private String confirmationToken;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Calendar getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Calendar birthDate) {
		this.birthDate = birthDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public PermissionEnum getPermission() {
		return permission;
	}
	public void setPermission(PermissionEnum permission) {
		this.permission = permission;
	}
	public UserConfirmedEnum getConfirmed() {
		return confirmed;
	}
	public void setConfirmed(UserConfirmedEnum confirmed) {
		this.confirmed = confirmed;
	}
	public String getConfirmationToken() {
		return confirmationToken;
	}
	public void setConfirmationToken(String confirmationToken) {
		this.confirmationToken = confirmationToken;
	}	
	
}
