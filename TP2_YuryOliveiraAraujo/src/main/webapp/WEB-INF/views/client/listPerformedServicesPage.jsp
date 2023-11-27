<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lista de Serviços Executados</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
    <script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>

    <div class="container">
        <h2 class="py-3">Lista de Serviços Executados</h2>
		
		<c:choose>
            <c:when test="${empty completedServices}">
                <div class="empty-list">
                    <i class="bi bi-exclamation-triangle-fill text-muted"></i>
                    <p class="text-muted">Oops! Parece que seus serviços ainda não foram realizados.</p>
                </div>
            </c:when>
            <c:otherwise>
		        <table class="table table-bordered">
		            <thead>
		                <tr>
		                    <th>Data</th>
		                    <th>Cão</th>
		                    <th>Serviços</th>
		                    <th>Total</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="appointment" items="${completedServices}">
		                    <tr>
		                        <td>${appointment.formattedPerformedDate}</td>
		                        <td>${appointment.dog.name}</td>
		                        <td>
		                            <select class="form-control">
		                                <c:forEach var="service" items="${appointment.serviceList}">
		                                    <option>${service.name} - R$ ${service.price }</option>
		                                </c:forEach>
		                            </select>
		                        </td>
		                        <td>${String.format("R$ %.2f", appointment.total)}</td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
	        </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
