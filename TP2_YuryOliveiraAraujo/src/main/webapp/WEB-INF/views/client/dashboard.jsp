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
	<p><a href="registerDogPage">Cadastrar c�o</a></p>
	<p><a href="updateProfilePage">Perfil</a></p>
	<p><a href="scheduleServicePage">Agendar servi�o</a></p>
	<p><a href="listScheduleServicesPage">Listar servi�os agendados</a></p>
	<p><a href="listPerformedServicesPage">Listar servi�os executados</a></p>
	
	<a href="logout">Sair</a>	
	
	<h2>Meus C�es</h2>
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