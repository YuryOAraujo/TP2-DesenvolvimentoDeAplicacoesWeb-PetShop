<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Petshop Cão Q-Late - Cliente</title>
</head>
<body>
	<p>Petshop Cão Q-Late - Cliente</p>
	<p><a href="registerDogPage">Cadastrar cão</a></p>
	<p><a href="updateProfilePage">Perfil</a></p>
	<p><a href="scheduleServicePage">Agendar serviço</a></p>
	<p><a href="listScheduleServicesPage">Listar serviços agendados</a></p>
	<p><a href="listPerformedServicesPage">Listar serviços executados</a></p>
	
	<a href="logout">Sair</a>	
	
	<h2>Meus Cães</h2>
<ul>
    <c:forEach var="dog" items="${dogs}">
        <li>
            <img src="data:image/jpeg;base64,${dog.base64Image}" alt="${dog.name} Image"/>
            ${dog.name} - ${dog.breed} - ${dog.size}            
        </li>
    </c:forEach>
</ul>
	
</body>
</html>