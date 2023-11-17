package yoa.daw.utilities;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class EmailService {
	public static void sendConfirmationEmail(String name, String email, String token) {
		String subject = "Petshop Cão Q-Late - Verificação de Email";
	    String message = String.format("Olá, %s!\n\nSeja bem vindo ao nosso petshop, para confirmar seu cadastro clique no link abaixo.\n\n"
	    		+ "http://localhost:8080/TP2_YuryOliveiraAraujo/verifyEmail?confirmationToken=%s", name, token);
	    
	    EmailService.sendEmail(email, subject, message);
	}
	
	@SuppressWarnings("deprecation")
	public static void sendEmail(String address, String subject, String message) {
		String addressFrom = "yuser.testing@gmail.com";
		String password = "bdww enic iops yrpa";
		
		try {
			SimpleEmail email = new SimpleEmail();			
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);			
			email.setAuthentication(addressFrom, password);
			email.setTLS(true);
			email.setSSLOnConnect(true);
			email.setFrom(addressFrom);
			email.setSubject(subject);
			email.setMsg(message);
			email.addTo(address);
			email.send();
		} catch (EmailException e) {
		}
	}
}

