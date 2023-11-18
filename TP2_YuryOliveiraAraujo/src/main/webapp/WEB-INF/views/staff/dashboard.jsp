<%@page import="yoa.daw.model.Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Petshop Cão Q-Late - Funcionário</title>
</head>
<body>
	<p>Petshop Cão Q-Late - Funcionário</p>
	<p><a href="registerServicePage">Cadastrar serviço</a></p>
	<p><a href="updateServicePage">Atualizar serviços</a></p>
	<p><a href="listServicesPage">Agenda de serviços</a></p>
	<p><a href="performServicesPage">Executar serviços</a></p>
	<p><a href="performedServicesReportPage">Gerar relatório</a></p>
	
	<a href="logout">Sair</a>	
	
	<h2>Serviços</h2>
	<ul>
	    <c:forEach var="service" items="<%= new yoa.daw.dao.DAO<Service>(Service.class).list() %>">
	        <li>
	            ${service.name} - ${service.price}
	        </li>
	    </c:forEach>
	</ul>
</body>
</html>