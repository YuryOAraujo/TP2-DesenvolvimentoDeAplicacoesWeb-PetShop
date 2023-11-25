<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agenda de serviços</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
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
<body class="bg-light">
    <div class="container mt-4">
        <h2 class="mb-4">Agenda de Serviços</h2>
        <div class="form-group">
            <label for="dateInput">Selecione uma data:</label>
            <input type="date" id="dateInput" required class="form-control">
        </div>    
        <div class="text-center">    
            <button id="searchButton" class="btn btn-info my-3">Pesquisar</button>
        </div>

        <table id="appointmentTable" class="table table-bordered">
        </table>
    </div>
</body>
</html>
