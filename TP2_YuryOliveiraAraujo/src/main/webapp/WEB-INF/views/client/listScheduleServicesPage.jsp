<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lista de Serviços Agendados</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
    <script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        function cancelAppointment(id) {
            $.post("cancelAppointment", { "id": id }, function () {
                $("#appointment_" + id).closest("tr").hide();
            });
        }
    </script>
</head>
<body>

    <div class="container">
        <h2 class="py-3">Lista de Serviços Agendados</h2>

	<c:choose>
            <c:when test="${empty scheduleServices}">
                <div class="empty-list">
                    <i class="bi bi-exclamation-triangle-fill text-muted"></i>
                    <p class="text-muted">Oops! Parece que nenhum serviço foi agendado. <a href="<c:url value='/scheduleServicePage'/>">Que tal agendar um agora?</a> </p>
                </div>
            </c:when>
            <c:otherwise>
		        <table class="table table-bordered">
		            <thead>
		                <tr>
		                    <th>Data</th>
		                    <th>Cão</th>
		                    <th>Serviços</th>
		                    <th>Cancelar</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="appointment" items="${scheduleServices}">
		                    <tr id="appointment_${appointment.id}">
		                        <td>${appointment.formattedScheduleDate}</td>
		                        <td>${appointment.dog.name}</td>
		                        <td>
		                            <select class="form-control">
		                                <c:forEach var="service" items="${appointment.serviceList}">
		                                    <option>${service.name}</option>
		                                </c:forEach>
		                            </select>
		                        </td>
		                        <td>
		                            <c:choose>
									    <c:when test="${appointment.cancelable}">
									        <a href="#" class="btn btn-danger" onClick="cancelAppointment(${appointment.id})">Cancelar serviço</a>
									    </c:when>
									    <c:otherwise>
									        <button class="btn btn-secondary" disabled>Cancelar serviço</button>
									    </c:otherwise>
									</c:choose>
		                        </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
	        </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
