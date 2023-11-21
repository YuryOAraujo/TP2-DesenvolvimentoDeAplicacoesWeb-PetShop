<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agendar serviço</title>
</head>
<body>
    <p>Agendar serviço</p>
    
    <c:if test="${not empty message}">
        <div style="color: red;">
            ${message}
        </div>
    </c:if>

    <form action="scheduleService" method="post">
        <label for="dog">Selecione o cão:</label>
        <select id="dog" name="dogId" required>
            <c:forEach var="dog" items="${dogs}">
                <option value="${dog.id}">${dog.name}</option>
            </c:forEach>
        </select><br>

        <label for="services">Selecione os serviços:</label><br>
        <c:forEach var="service" items="${services}">
            <input type="checkbox" name="list" value="${service.id}">
            <label>${service.name}</label><br>
        </c:forEach>
        
        <label for="scheduleDate">Data de agendamento:</label>
    	<input type="text" id="scheduleDate" name="scheduleDate" placeholder="dd/MM/yyyy" required><br>        

        <input type="submit" value="Agendar">
    </form>
</body>
</html>
