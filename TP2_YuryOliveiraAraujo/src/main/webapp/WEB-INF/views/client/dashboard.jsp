<%@page import="yoa.daw.model.User"%>
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
	<p><a href="<c:url value='/registerDogPage'/>">Cadastrar cão</a></p>
    <p><a href="<c:url value='/updateProfilePage'/>">Perfil</a></p>
    <p><a href="<c:url value='/scheduleServicePage'/>">Agendar serviço</a></p>
    <p><a href="<c:url value='/listScheduleServicesPage'/>">Listar serviços agendados</a></p>
    <p><a href="<c:url value='/listPerformedServicesPage'/>">Listar serviços executados</a></p>
	
	<a href="logout">Sair</a>	
	
	<h2>Meus Cães</h2>
	<ul>
	    <c:forEach var="dog" items="${dogs}">
	        <li>
	            ${dog.name} - ${dog.breed} - ${dog.size.size}            
	        </li>
	    </c:forEach>
	</ul>
</body>
</html>