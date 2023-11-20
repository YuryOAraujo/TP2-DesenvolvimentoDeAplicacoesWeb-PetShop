<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atualizar serviço - ${service.id}</title>
</head>
<body>
	<h3>Atualizar serviço - ${service.id}</h3>
	<form action="updateService" method="post">
		<input type="hidden" name="id" value="${service.id}">
		<label for="name">Nome:</label>
        <input type="text" id="name" name="name" value="${service.name}" readonly><br>
        <label for="price">Preço:</label>
        <input type="text" id="price" name="price" value="${service.price}"><br>
		<input type="submit" value="Update">
	</form>
</body>
</html>