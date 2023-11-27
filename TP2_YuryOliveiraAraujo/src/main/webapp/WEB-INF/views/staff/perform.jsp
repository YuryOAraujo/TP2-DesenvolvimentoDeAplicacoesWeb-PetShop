<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Petshop Cão Q-Late - Realizar serviço</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".price-mask").mask("R$00.00", { reverse: true });
        });
        
        function validateForm() {
            var scheduleDate = new Date(convertToISODate($("#scheduleDate").val()));            
            var performedDate = new Date($("#performedDate").val());

            if (performedDate < scheduleDate) {
                $("#error-message").html('<div class="alert alert-danger" role="alert">A data de realização deve ser posterior à data de agendamento.</div>');
                return false;
            }
            
            return true;
        }
        
        function convertToISODate(inputDate) {
            var parts = inputDate.split('/');
            if (parts.length === 3) {
                return parts[2] + '-' + parts[1] + '-' + parts[0];
            }
        }

    </script>
</head>
<body>
    <div class="container mt-4">
        <h2>Realizar Serviço</h2>
        
        <div id="error-message" class="mt-2"></div>
        
        <div class="form-group mt-3">
            <label for="scheduleDate">Data de Agendamento:</label>
            <input type="text" id="scheduleDate" name="scheduleDate" class="form-control" value="${appointment.formattedScheduleDate}" readonly>
        </div>
        
        <div class="form-group mt-3">
            <label for="dogName">Cão:</label>
            <input type="text" id="dogName" name="dogName" class="form-control" value="${appointment.dog.name}" readonly>
        </div>
        
        <div class="form-group">
            <label for="serviceList" class=" mt-3">Serviços:</label>
            <table class="table" style="margin-top: 0">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Valor</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="service" items="${appointment.serviceList}">
                        <tr>
                            <td>${service.name}</td>
                            <td class="price-mask">R$ ${service.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <form action="performService" method="post" id="performServiceForm" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="total">Total:</label>
                <input type="text" id="total" name="total" class="form-control bg-info text-light mb-3 text-right font-weight-bold" value="${appointment.total}" readonly>
            </div>
            <div class="form-group">
                <label for="performedDate">Data de Realização:</label>
                <input type="date" id="performedDate" name="performedDate" class="form-control" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-info my-3">Realizar Serviço</button>
            </div>
            <input type="hidden" name="id" value="${appointment.id}">
        </form>
    </div>
</body>
</html>
