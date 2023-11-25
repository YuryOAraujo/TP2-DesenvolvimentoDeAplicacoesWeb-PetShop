<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Petshop Cão Q-Late - Cliente</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-info">
    <a class="navbar-brand  text-light ml-5" href="client-dashboard">Petshop Cão Q-Late</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ">
            <li class="nav-item">
                <a class="nav-link  text-light" href="<c:url value='/registerDogPage'/>">Cadastrar cão</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-light" href="<c:url value='/updateProfilePage'/>">Perfil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-light" href="<c:url value='/scheduleServicePage'/>">Agendar serviço</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-light" href="<c:url value='/listScheduleServicesPage'/>">Listar serviços agendados</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-light" href="<c:url value='/listPerformedServicesPage'/>">Listar serviços executados</a>
            </li>
            <li class="nav-item">
                <a class="nav-link  text-light" href="logout">Sair</a>
            </li>
        </ul>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
