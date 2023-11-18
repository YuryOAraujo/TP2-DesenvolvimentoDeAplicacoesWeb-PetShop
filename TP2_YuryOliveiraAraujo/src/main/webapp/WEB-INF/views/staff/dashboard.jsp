<%@page import="yoa.daw.model.Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Petshop C�o Q-Late - Funcion�rio</title>
</head>
<body>
	<p>Petshop C�o Q-Late - Funcion�rio</p>
	<p><a href="registerServicePage">Cadastrar servi�o</a></p>
	<p><a href="updateServicePage">Atualizar servi�os</a></p>
	<p><a href="listServicesPage">Agenda de servi�os</a></p>
	<p><a href="performServicesPage">Executar servi�os</a></p>
	<p><a href="performedServicesReportPage">Gerar relat�rio</a></p>
	
	<a href="logout">Sair</a>	
	
	<h2>Servi�os</h2>
	<ul>
	    <c:forEach var="service" items="<%= new yoa.daw.dao.DAO<Service>(Service.class).list() %>">
	        <li>
	            ${service.name} - ${service.price}
	        </li>
	    </c:forEach>
	</ul>
</body>
</html>