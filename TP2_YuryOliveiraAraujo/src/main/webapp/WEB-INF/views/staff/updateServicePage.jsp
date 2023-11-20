<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atualizar serviços</title>
</head>
<body>
	<p>Atualizar serviços</p>
	
	<h2>Serviços</h2>
	<ul>
	    <c:forEach var="service" items="${services}">
	        <li>
	            ${service.name} - ${service.price} - <a href="displayService?id=${service.id}">Atualizar</a>
	        </li>
	    </c:forEach>
	</ul>
</body>
</html>