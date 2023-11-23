<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Petshop Cão Q-Late - Realizar serviço</title>
</head>
<body>

    <h2>Realizar Serviço</h2>

    <p>Data de Agendamento: ${appointment.formattedScheduleDate}</p>
    <p>Cão: ${appointment.dog.name}</p>
    <p>Serviços</p>
    <c:forEach var="service" items="${appointment.serviceList}">
        <option>${service.name}</option>
    </c:forEach>
    <p>Valor: ${appointment.total}</p>

	<form action="performService" method="post">
        <label for="performedDate">Data de Realização:</label>
        <input type="date" id="performedDate" name="performedDate" required>
        <input type="hidden" name="id" value="${appointment.id}">
        <input type="hidden" name="total" value="${appointment.total}">
        <button type="submit">Realizar Serviço</button>
    </form>
</body>
</html>
