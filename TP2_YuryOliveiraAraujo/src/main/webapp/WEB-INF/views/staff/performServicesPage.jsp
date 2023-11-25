<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Executar serviços</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Executar serviços</h2>
        <c:choose>
            <c:when test="${empty appointments}">
                <div class="empty-list">
                    <i class="bi bi-exclamation-triangle-fill text-muted"></i>
                    <p class="text-muted">Oops! Parece que nenhum serviço precisa ser executado no momento.</p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Data</th>
                            <th>Cão</th>
                            <th>Serviços</th>
                            <th>Finalizar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="appointment" items="${appointments}">
                            <tr>
                                <td>${appointment.formattedScheduleDate}</td>
                                <td>${appointment.dog.name}</td>
                                <td>
                                    <select class="form-control">
                                        <c:forEach var="service" items="${appointment.serviceList}">
                                            <option>${service.name}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td><a href="performAppointment?id=${appointment.id}" class="btn btn-info">Finalizar</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
