<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Serviços Agendados</title>
    <script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <script type="text/javascript">
        function cancelAppointment(id) {
            $.post("cancelAppointment", { "id": id }, function () {
                $("#appointment_" + id).closest("tr").hide();
            });
        }
    </script>

    <p>Lista de Serviços Agendados</p>

    <h2>Serviços Agendados</h2>
    <table border="1">
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
                        <select>
                            <c:forEach var="service" items="${appointment.serviceList}">
                                <option>${service.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <c:if test="${appointment.cancelable}">
                            <a href="#" onClick="cancelAppointment(${appointment.id})">Cancelar serviço</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
