<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agendar serviço</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
</head>
<body>

    <div class="container">
        <h2 class="py-3">Agendar serviço</h2>

		<div id="success-message" class="mt-2">
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">${success}</div>
            </c:if>
        </div>
        
        <c:if test="${not empty message}">
            <div class="alert alert-danger">
                ${message}
            </div>
        </c:if>

        <form action="scheduleService" method="post">
            <div class="form-group">
                <label for="dog">Selecione o cão:</label>
                <select id="dog" name="dogId" class="form-control" required>
                    <c:forEach var="dog" items="${dogs}">
                        <option value="${dog.id}">${dog.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="services">Selecione os serviços:</label><br>
                <c:forEach var="service" items="${services}">
                    <div class="form-check">
                        <input type="checkbox" name="list" value="${service.id}" class="form-check-input">
                        <label class="form-check-label">${service.name}</label>
                    </div>
                </c:forEach>
            </div>

            <div class="form-group">
                <label for="scheduleDate">Data de agendamento:</label>
                <input type="text" id="scheduleDate" name="scheduleDate" placeholder="dd/MM/yyyy" class="form-control" required>
            </div>
	
			<div class="text-center">
            	<button type="submit" class="btn btn-info my-3">Agendar</button>
            </div>
        </form>
    </div>

</body>
</html>
