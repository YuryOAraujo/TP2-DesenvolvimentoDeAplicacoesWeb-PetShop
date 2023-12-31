<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gerar relatório</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
    <script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#searchButton").click(function () {
                var startDate = $("#startDate").val();
                var endDate = $("#endDate").val();
                fetchAppointments(startDate, endDate);
            });

            function fetchAppointments(startDate, endDate) {
                $.post("displayReport", {"startDate": startDate, "endDate": endDate}, function(response) {
                    $("#appointmentTable").html(response);
                    applyPriceMask();
                });
            }
            
            function applyPriceMask() {
                $(".price-mask").mask("R$00.00", { reverse: true });
            };
        });
    </script>
</head>
<body class="bg-light">
    <div class="container mt-4">
        <h2 class="mb-4">Gerar relatório</h2>
        <div class="form-group">
            <label for="startDate">Data de início:</label>
            <input type="date" id="startDate" required class="form-control">
        </div>
        <div class="form-group my-3">
            <label for="endDate">Data final:</label>
            <input type="date" id="endDate" required class="form-control">
        </div>
        <div class="text-center">
            <button id="searchButton" class="btn btn-info my-3">Pesquisar</button>
        </div>
        
        <table id="appointmentTable" class="table table-bordered">
        </table>
    </div>
</body>
</html>
