<%@page import="yoa.daw.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Petshop C�o Q-Late - Cliente</title>
</head>
<body>
	<p>Petshop C�o Q-Late - Cliente</p>
	<p><a href="<c:url value='/registerDogPage'/>">Cadastrar c�o</a></p>
    <p><a href="<c:url value='/updateProfilePage'/>">Perfil</a></p>
    <p><a href="<c:url value='/scheduleServicePage'/>">Agendar servi�o</a></p>
    <p><a href="<c:url value='/listScheduleServicesPage'/>">Listar servi�os agendados</a></p>
    <p><a href="<c:url value='/listPerformedServicesPage'/>">Listar servi�os executados</a></p>
	
	<a href="logout">Sair</a>	
	
	<h2>Meus C�es</h2>
	<ul>
	    <c:forEach var="dog" items="${dogs}">
	        <li>
	            ${dog.name} - ${dog.breed} - ${dog.size.size}            
	        </li>
	    </c:forEach>
	</ul>
</body>
</html>