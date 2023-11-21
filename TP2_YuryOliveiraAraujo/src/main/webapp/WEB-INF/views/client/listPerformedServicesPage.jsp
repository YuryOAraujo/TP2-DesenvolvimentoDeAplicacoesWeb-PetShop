<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de Serviços Executados</title>
</head>
<body>
	<p>Lista de Serviços Executados</p>
	
	<h2>Serviços Executados</h2>
	<ul>
	    <c:forEach var="appointment" items="${completedServices}">
	        <li>
	            ${appointment.scheduleDate} - ${appointment.dog.name} <br>
	            Serviços 
	            <c:forEach var="service" items="${appointment.serviceList}">
                    <ul><li>${service.name} - ${service.price }</li></ul>
                </c:forEach>     
                Total: ${appointment.total}      
	        </li>
	        <br>
	    </c:forEach>
	</ul>
</body>
</html>