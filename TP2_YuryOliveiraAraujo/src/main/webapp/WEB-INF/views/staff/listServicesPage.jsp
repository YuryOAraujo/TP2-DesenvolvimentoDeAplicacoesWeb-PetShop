<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agenda de serviços</title>
    <script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#searchButton").click(function () {
                var startDate = $("#dateInput").val();
                fetchAppointments(startDate);
            });

            function fetchAppointments(startDate) {
                $.post("listAppointments", {"startDate": startDate}, function(response){
                	$("#appointmentTable").html(response)
                })
            }
        });
    </script>
</head>
<body>
    <p>Agenda de serviços</p>
    <label for="dateInput">Selecione uma data:</label>
    <input type="date" id="dateInput" required>
    <button id="searchButton">Pesquisar</button>

    <table id="appointmentTable" border="1">
    	
    </table>
</body>
</html>
