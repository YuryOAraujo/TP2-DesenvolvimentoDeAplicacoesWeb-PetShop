<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gerar relatório</title>

<script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#searchButton").click(function () {
                var startDate = $("#startDate").val();
                var endDate = $("#endDate").val();
                fetchAppointments(startDate, endDate);
            });

            function fetchAppointments(startDate, endDate){
                $.post("displayReport", {"startDate": startDate, "endDate": endDate}, function(response){
                	$("#appointmentTable").html(response)
                })
            }
        });
    </script>
</head>
<body>
	<p>Gerar relatório</p>
	
	<label for="startDate">Data de início:</label>
    <input type="date" id="startDate" required>
    
    <label for="endDate">Data final:</label>
    <input type="date" id="endDate" required>
    
    <button id="searchButton">Pesquisar</button>

    <table id="appointmentTable" border="1">
    	
    </table>
</body>
</html>