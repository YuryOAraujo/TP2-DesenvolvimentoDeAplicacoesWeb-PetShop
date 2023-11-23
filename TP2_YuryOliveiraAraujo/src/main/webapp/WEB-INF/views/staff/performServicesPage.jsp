<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Executar serviços</title>
</head>
<body>
	<p>Executar serviços</p>
	
	<table border="1">
		<tr>
			<th>Data</th>
			<th>Cão</th>
			<th>Serviços</th>
			<th>Finalizar</th>
		</tr>
		
		<c:forEach var="appointment" items="${appointments}">
		    <tr>
		        <td>${appointment.formattedScheduleDate}</td>
		        <td>${appointment.dog.name}</td>
		        <td>
		            <select>
		                <c:forEach var="service" items="${appointment.serviceList}">
		                    <option>${service.name}</option>
		                </c:forEach>
		            </select>
		        </td>
		        <td><a href="performAppointment?id=${appointment.id}">Finalizar?</a>
		    </tr>
		</c:forEach>
	</table>
</body>
</html>